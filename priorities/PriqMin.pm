# priority queue selecting minimum

package PriqMin;

sub exchange {
    my $self = shift;
    ( $self->{q}[ $_[0] ], $self->{q}[ $_[1] ] ) =
      ( $self->{q}[ $_[1] ], $self->{q}[ $_[0] ] );
}

sub insert {
    my ($self, $value, $weight) = @_;
    $self->{q}[ ++$self->{N} ] = [ $value, $weight ];
    $self->swim( $self->{N} );
}

sub less {
    my $self = shift;
    $self->{q}[ $_[1] ][1] < $self->{q}[ $_[0] ][1];
}

sub new { bless { N => 0, q => [undef] }, $_[0] }

sub pop {
    my $self = shift;
    return if $self->{N} == 0;
    my $ref = $self->{q}[1];
    $self->exchange( 1, $self->{N}-- );
    pop @{ $self->{q} };
    $self->sink(1);
    return @$ref;
}

sub peek {
    my $self = shift;
    return if $self->{N} == 0;
    return @{$self->{q}[1]};
}

sub sink {
    my ( $self, $k ) = @_;
    while ( $k << 1 <= $self->{N} ) {
        my $j = $k << 1;
        if ( $j < $self->{N} and $self->less( $j, $j + 1 ) ) { $j++ }
        if ( !$self->less( $k, $j ) ) { last }
        $self->exchange( $k, $j );
        $k = $j;
    }
}

sub swim {
    my ( $self, $k ) = @_;
    my $hk = $k >> 1;
    while ( $k > 1 and $self->less( $hk, $k ) ) {
        $self->exchange( $hk, $k );
        $k  = $hk;
        $hk = $k >> 1;
    }
}

1;
