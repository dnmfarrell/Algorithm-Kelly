use strict;
use warnings;
package Algorithm::Kelly;

# ABSTRACT: calculates the fraction of of your bankroll to bet using the Kelly formula

BEGIN
{
  require Exporter;
  use base 'Exporter';
  our @EXPORT = 'optimal_f';
}

=head2 SYNOPSIS

    use Algorithm::Kelly;
    use feature 'say';

    say optimal_f(0.5, 2); # 0.25

=cut

=head2 FUNCTIONS

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

1;
