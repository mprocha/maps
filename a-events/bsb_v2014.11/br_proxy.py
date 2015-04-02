# -*- coding: utf-8 -*-
'''
mb or mR: MW (m) = 1.121m − 0.76 +/- 0.3
MW (Af ) = 0.81+0.639 log(Af ) + 0.00084􏱮Af
mb(I0) = 1.21 + 0.45I0 then MW (m)
MW (m, Af ) = 0.7MW (m) + 0.3MW (Af )
'''
import numpy as np

class BR_proxy(object):

	def __init__(self):
		pass

	def from_mb(self, mb):
		mw = 1.121*mb - 0.76
		return mw, 0.3

	def from_af(self, af):
		# changing units
		af = af*1000.
		# # equation IV
		# return 0.8 * np.log10(af) + 0.6
		# # equation III
		mw = 0.81 + 0.639*np.log10(af) + 0.00084*np.sqrt(af)
		return mw, 0.4

	def from_i0(self, i0):
		mb = 1.21 + 0.45*i0
		mw, _ = self.from_mb(mb)
		return mw, 0.6

	def from_mb_af(self, mb, af):
		m_mb, _ = self.from_mb(mb)
		m_af, _ = self.from_af(af)
		m = 0.7*m_mb + 0.3*m_af
		return m, 0.33


if __name__ == "__main__":
	import matplotlib.pyplot as plt

	dm = 0.25
	_m = np.arange(3, 7 + dm, dm)
	_i = np.arange(1, 10, 1)
	_a = np.arange(0, 1000, 100)

	p = BR_proxy()

	print p.from_mb(3.5)
	__m, x = p.from_i0(5)
	print p.from_mb(__m)
	# print from_af(180)

	exit()


	mw, _ = p.from_mb(_m)
	plt.scatter(_m, mw)
	plt.show()

	mw, _ = p.from_i0(_i)
	plt.scatter(_i, mw)
	plt.show()

	mw, _ = p.from_af(_a)
	plt.scatter(_a, mw)
	plt.show()
