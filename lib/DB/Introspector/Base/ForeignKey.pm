package DB::Introspector::Base::ForeignKey;

use strict;

sub foreign_table {
    my $self = shift;
    die("foreign_table not defined for ".ref($self));
}

sub foreign_column_names {
    my $self = shift;
    die("foreign_column_names not defined for ".ref($self));
}

sub local_column_names {
    my $self = shift;
    die("local_column_names not defined for ".ref($self));
}

sub new {
    my $class = shift;
    my $local_table = shift;

    my $self = bless({_local_table => $local_table}, ref($class) || $class);


    return $self;
}


sub local_table {
    my $self = shift;
    return $self->{_local_table};
}


1;
__END__

=head1 NAME

DB::Introspector::Base::ForeignKey

=head1 SYNOPSIS

=over 4

use DB::Introspector;

my $introspector = DB::Introspector->get_instance($dbh);
my $table = $introspector->find_table('users');

foreach my $foreign_key ($table->foreign_keys) {
    print "Foreign Key name:\t".$foreign_key->name."\n";
    print "Foreign Key local table:\t".$foreign_key->local_table->name."\n";
    print "Foreign Key foreign table:\t".$foreign_key->foreign_table->name."\n";
}

=back
     
=head1 DESCRIPTION

DB::Introspector::Base::ForeignKey is a class that represents a table's foreign
key. The 'local_table' is the table that depends on the foreign table. This
(local_table) can be considered the child table because data in the local table depends on the existence of data in the foreign table.

=head1 ABSTRACT METHODS

=over 4



=item $foreign_key->foreign_table

=over 4

Returns: The table that the 'local_table' depends on. 

=back


=item $foreign_key->foreign_column_names

=over 4

Returns: an array (@) of foreign column names in order such that they can be
mapped to the local column names. 

=back


=item $foreign_key->local_column_names

=over 4

Returns: an array (@) of local column names in order such that they can be
mapped to the foreign column names. 

=back


=back

=head1 METHODS



=item DB::Introspector::Base::ForeignKey->new($local_table);

=over 4

Params:

=over 4

$local_table - a DB::Introspector::Base::Table instance

=back

Returns: an instance of a DB::Introspector::Base::ForeignKey

=back



=item $foreign_key->local_table

=over 4

Returns: The child table in this foreign key relationship

=back



=head1 SEE ALSO

=over 4

L<DB::Introspector>

L<DB::Introspector::Base::Table>


=back


=head1 AUTHOR

Masahji C. Stewart

=head1 COPYRIGHT

The DB::Introspector::Base::ForeignKey module is free software; you can
redistribute it and/or modify it under the same terms as Perl itself.

=cut