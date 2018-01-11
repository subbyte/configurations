#!/usr/bin/env python3

""" DNS Traffic Monitor: Tracking Your DNS Leaks
"""

__author__ = "Xiaokui Shu"
__copyright__ = "Copyright 2018, Xiaokui Shu"
__license__ = "Apache"
__version__ = "1.0.0"
__maintainer__ = "Xiaokui Shu"
__email__ = "xiaokui.shu@ibm.com"

import subprocess
import itertools

tcpdump = ['sudo', 'tcpdump', '-vvv', '-l', '-n', 'port 53']

def capturedDomainIter ():
    p = subprocess.Popen(tcpdump, stdout=subprocess.PIPE)
    for row in iter(p.stdout.readline, None):
        lineItems = row.decode("utf-8").rstrip().split(' ')
        lineItemsStripped = [x.rstrip(',') for x in lineItems]
        domainnames = [x for x in lineItemsStripped if x.endswith('.')]
        if domainnames:
            for domain in set(domainnames):
                yield domain

def printIfNotSameIter (it):
    itC, itP = itertools.tee(it)
    next(itP)
    for item, itemP in zip(itC, itP):
        if item != itemP:
            yield item

if __name__ == "__main__":
    for domain in printIfNotSameIter(capturedDomainIter()):
        comps = domain.split('.')
        if len(comps) > 2:
            firstleveldomain = comps[-3]
        else:
            firstleveldomain = domain[-2]
        print("{0:16}| {1}".format(firstleveldomain, domain))
