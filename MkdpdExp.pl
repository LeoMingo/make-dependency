use warnings;
use strict;
#use diagnostics;

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

sub first_char {
    my $str = shift;
    my @str_arr = split //, $str;
    return $str_arr[0];
}

sub last_char {
    my $str = shift;
    my @str_arr = split //, $str;
    return $str_arr[$#str_arr];
}

sub concat_arr {
    my $arr_ref1 = $_[0];
    my $arr_ref2 = $_[1];
    my @arr1 = @$arr_ref1;
    my @arr2 = @$arr_ref2;

    foreach my $i (@arr2) {
        push @arr1, $i;
    }
    return @arr1;
}


sub rm_elem {
    my $arr_ref = $_[0];
    my $idx = $_[1];
    
    my @arr = @$arr_ref;
    my @leftpart = ();
    my @rightpart = ();

    for(my $i = 0; $i < $idx; $i++){
        push @leftpart, $arr[$i],
    }
    for(my $i = $idx+1; $i <= $#arr; $i++){
        push @rightpart, $arr[$i],
    }

    say @leftpart, @rightpart;
    say "abc";

    my @new_arr = concat_arr(\@leftpart, \@rightpart);
    return @new_arr;
}




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

#Direct access unit
#a leveloption-stringbehavior array
#(level-option, string-behavior)
#e.g. ("+1", "folder/")




sub make_dpd_line_arr {
    my $dpd_line = shift;
    my @dpd_line_char_arr = split //, $dpd_line;
    my @levelOp_char_arr = ();
    my @str_behav_char_arr = ();
    
    my @dpd_line_arr = ();

    for my $i (0..1) {
        push $dpd_line_char_arr[$i], @levelOp_char_arr;
    }
    for(my $i = 2; $i < $#dpd_line_char_arr; $i++){
        push $dpd_line_char_arr[$i], @str_behav_char_arr;
    }
    
    my $levelOp = join //, @levelOp_char_arr;
    my $str_behav = join //, @str_behav_char_arr;
    
    push $levelOp @dpd_line_arr;
    push $str_behav @dpd_line_arr;

    return @dpd_line_arr;
}


sub levelOp {
    my @dpdlarr = @_;
    return $dpdlarr[0];
}

sub dpdl_str_behav {
    my @dpdlarr = @_;
    return $dpdlarr[1];
}



######Level-Option manipulation###########

sub make_levelOp_arr {
    my @dpdlarr = @_;
    my $levelOp = levelOp @dpdlarr;
    my @levelOp_arr = split //, $levelOp;
    return @levelOp_arr;
}


sub dpdl_level {
    my @dpdlarr = @_;
    my @levelOp_arr = make_levelOp_arr @dpdlarr;
    my $level = (levelOp_arr)[1];
    return $level;
}


sub dpdl_op {
    my @dpdlarr = @_;
    my @levelOp_arr = make_levelOp_arr @dpdlarr
    my $option = (@levelOp_arr)[0];
    return $option;
}


sub same_level {
    my $dpdlarr_ref1 = $_[0];
    my $dpdlarr_ref2 = $_[1];
    my $level1 = dpdl_level @$dpdlarr_ref1;
    my $level2 = dpdl_level @$dpdlarr_ref2;

    if($level1 eq $level2){
        return 1;
    }else{
        return 0;
    }
}

sub dpdl_datatype {
    my @dpdlarr = @_
    my $sb = str_behav @dpdlarr;

    if ((first_char $sb eq '"') && (last_char $sb eq '"')){
        return "s";
    }elsif (last_char $sb eq '/'){
        return "d";
    }else {
        return "f";
    }
}

sub same_dpdl_datatype {
    my $dpdlarr_ref1 = $_[0];
    my $dpdlarr_ref2 = $_[1];
    my $datatype1 = dpdl_datatype @$dpdlarr_ref1;
    my $datatype2 = dpdl_datatype @$dpdlarr_ref2;

    if ($datatype1 eq $datatype2){
        return 1;
    }else {
        return 0;
    }
}



###############String-Behavior Manipulation###################

##############################################################


=head1

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





#=head1
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







