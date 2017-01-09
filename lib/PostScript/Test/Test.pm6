unit module PostScript::Lib::Test;

sub gs-test($ps-code --> Bool) is export(:gs-test) {
    # uses Ghostscript gs to test for correct PS code
}

