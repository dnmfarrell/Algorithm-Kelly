use strict;
use warnings;
package Algorithm::Kelly;

# ABSTRACT: calculates the fraction of a bankroll to bet using the Kelly formula

BEGIN
{
  require Exporter;
  use base 'Exporter';
  our @EXPORT = 'optimal_f';
}

=head1 SYNOPSIS

    use Algorithm::Kelly;
    use feature 'say';

    say optimal_f(0.5, 2); # 0.25

=cut

=head1 FUNCTIONS

=head2 optimal_f ($probability, $payoff)

Returns the optimal L<fraction|https://en.wikipedia.org/wiki/Kelly_criterion> of bankroll to wager, using the Kelly Criterion, given the C<$probability> and C<$payoff>. Payoff should be the net odds of the wager, so the value of 3-to-1 would be 3. The C<optimal_f()> sub is exported by default.

=cut

sub optimal_f
{
  my ($probability, $payoff) = @_;

  unless (defined $probability
          && $probability >= 0
          && $probability <= 1
          && $payoff
          && $payoff > 0)
  {
    die "optimal_f() requires 2 args: probability (0-1) and payoff\n";
  }

  ($probability * $payoff - (1 - $probability)) / $payoff;
}

=head1 CONVERTING ODDS

Odds are usually presented in one of three styles: decimal, fraction or American. The C<optimal_f> sub requires the net decimal odds. These odds are all equal:

    Type      Example    Net Odds
    ----      --------   --------
    Decimal   4.0        3.0
    Fraction  3/1        3.0
    American  +300       3.0

The different odds representations are also explained L<here|http://www.olbg.com/school/lesson10.htm>.

=cut

1;
