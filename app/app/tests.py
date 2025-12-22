"""Tests for the calculator functions."""

from django.test import SimpleTestCase

from app.calc import add


class CalcTests(SimpleTestCase):
    """Tests for calculator functions."""

    def test_add_numbers(self):
        """Test adding two numbers together."""
        res = add(5, 6)

        self.assertEqual(res, 11)