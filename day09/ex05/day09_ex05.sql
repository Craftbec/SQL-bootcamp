DROP FUNCTION IF EXISTS fnc_persons_female ();
DROP FUNCTION IF EXISTS fnc_persons_male ();


CREATE FUNCTION fnc_persons (pgender varchar default 'female') RETURNS SETOF person AS $fnc_persons$
    my $rv = spi_exec_query("SELECT * FROM person WHERE gender = '" . $_[0] . "';");
    my $status = $rv->{status};
    my $nrows = $rv->{processed};
    foreach my $rn (0 .. $nrows - 1) {
        my $row = $rv->{rows}[$rn];
        $row->{i} += 200 if defined($row->{i});
        $row->{v} =~ tr/A-Za-z/a-zA-Z/ if (defined($row->{v}));
        return_next($row);
    }
    return undef;
$fnc_persons$ LANGUAGE plperl;