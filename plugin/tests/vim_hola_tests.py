import unittest
import vim_hola as sut


@unittest.skip("Don't forget to test!")
class HolaVimTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.vim_hola_example()
        self.assertEqual("Happy Hacking", result)
