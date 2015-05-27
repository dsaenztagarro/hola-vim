import unittest
import hola_vim as sut


@unittest.skip("Don't forget to test!")
class HolaVimTests(unittest.TestCase):

    def test_example_fail(self):
        result = sut.hola_vim_example()
        self.assertEqual("Happy Hacking", result)
