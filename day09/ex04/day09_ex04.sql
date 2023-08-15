CREATE FUNCTION fnc_persons_female ()
RETURNS SETOF person AS $fnc_persons_female$
    my $rv = spi_exec_query(" SELECT * FROM person WHERE gender = 'female'");
    my $status = $rv->{status};
    my $nrows = $rv->{processed};
    foreach my $rn (0 .. $nrows - 1) {
        my $row = $rv->{rows}[$rn];
        $row->{i} += 200 if defined($row->{i});
        $row->{v} =~ tr/A-Za-z/a-zA-Z/ if (defined($row->{v}));
        return_next($row);
    }
    return undef;
$fnc_persons_female$ LANGUAGE plperl;

CREATE FUNCTION fnc_persons_male ()
RETURNS SETOF person AS $fnc_persons_male$
    my $rv = spi_exec_query(" SELECT * FROM person WHERE gender = 'male'");
    my $status = $rv->{status};
    my $nrows = $rv->{processed};
    foreach my $rn (0 .. $nrows - 1) {
        my $row = $rv->{rows}[$rn];
        $row->{i} += 200 if defined($row->{i});
        $row->{v} =~ tr/A-Za-z/a-zA-Z/ if (defined($row->{v}));
        return_next($row);
    }
    return undef;
$fnc_persons_male$ LANGUAGE plperl;