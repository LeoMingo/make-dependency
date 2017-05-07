use warnings;
use strict;
use diagnostics;

use feature "say";


=head1 Functions

make_directory
make_file
write_string

====================

dir_dpd_arr
file_dpd_arr
push_to_dda
push_to_fda

dpd_arr_parser

--make_dpd_line_arr
--push_dpd_operation_char

--dpd_line_exec
--dpd_operation_datatype

draw_dpd_chart

=cut



sub make_directory {
    my $dir_name = shift;
    mkdir($dir_name, 0755);
}



sub write_str {
    my @fileargs = @_;
    my $filename = $fileargs[0];
    my $filestr = $fileargs[1];

    open(my $out, '>>', $filename);
    print $out, $filestr;
    close $out;
}

sub make_file {
    my $filename = shift;
    write_str $filename, "";
}


sub write_string {
    my @args = @_;
    my $filename = $args[0];
    my $fs = $args[1];

    write_str $filename, $fs;
}



my @dir_dpd_arr = ();
my @file_dpd_arr = ();

#(level-option, str_behavior)


sub levelOp_duplicate {
    my @pair1 = $_[0];
    my @pair2 = $_[1];
    my $
}
sub rm_elem {
        
}


sub push_to_dda {
    my @args = @_;
    my $levelOp = $args[0];
    my $dir_name = $args[1];
    my @levelOp_pair = ($levelOp, $dir_name);

    for pair in @dir_dpd_arr {
        if(levelOp_duplicate($levelOp_pair, pair)){
            rm_elem @dir_dpd_arr, pair;
        }
    }
    push @levelOp_pair @dir_dpd_arr;
}





=head1
sub push_to_fda {
    my @args = @_;
    my $level_op = $args[0];
    my $file_dpd_arr_name = $args[1];

    for pair in @file_dpd_arr {
        if(level_op_same $level_op pair[0])
        {
            rm pair;
        }
    }
    push @_ @file_dpd_arr;
}


#=head1

=cut







