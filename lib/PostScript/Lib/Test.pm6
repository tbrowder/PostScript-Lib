unit module PostScript::Lib::Test;

# basic use of 'gs' to test a chunk of PS code:
#
#   $ gs -q -dNOPAUSE -sNODISPLAY  1> gs.out 2> gs.err -- $input-ps-file
#
#   $ gs -q -dNOPAUSE -sNODISPLAY  1> gs.out 2> gs.err -- empty.ps
#
#      ps.out and ps.err are empty
#
#   $ gs -q -dNOPAUSE -sNODISPLAY  1> gs.out 2> gs.err -- good.ps
#
#      ps.out and ps.err are empty
#
#   $ gs -q -dNOPAUSE -sNODISPLAY  1> gs.out 2> gs.err -- bad.ps
#
#      gs.out and gs.err are NOT empty

constant $gs-out = "$*TMPDIR/gs.out";
constant $gs-err = "$*TMPDIR/gs.err";
constant $GS-TEST-CMD = "gs -q -dNOPAUSE -sNODISPLAY  1> $gs-out 2> $gs-err -- ";

sub gs-test($ps-code --> Bool) is export(:gs-test) {
    # uses Ghostscript gs to test for correct PS code

    my $p = Proc.new;

    $p = shell "$GS-TEST-CMD $ps-code", :out;

}
