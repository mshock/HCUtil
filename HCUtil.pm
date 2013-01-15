#! perl -w

# webapp for encoding and decoding header codes and table names

package HCUtil;

use strict;

use base qw(HTTP::Server::Simple::CGI);
use HTTP::Server::Simple::Static;

my $server = HCUtil->new(1337);
$server->run();

die 'HCUtil server has returned and is no longer running';

sub handle_request {
	my ( $self, $cgi ) = @_;

	my $params_string = '';
	for ( $cgi->param ) {
		$params_string .= sprintf( '--%s="%s" ', $_, $cgi->param($_) )
			if $cgi->param($_);
	}

	if ( $cgi->path_info =~ m/styles\.css/ ) {
		$self->serve_static( $cgi, './css' );
		return;
	}
	
	open( LOG, '>>', 'server.log' );
	printf LOG "[%s]\t%s\t%s\n", timestamp(),$cgi->remote_addr,$params_string;
	close LOG;
		
	print `perl portal.pl $params_string`;
}

sub timestamp {
	my @now = localtime(time);
	return
		sprintf "%4d-%02d-%02d %02d:%02d:%02d",
				 $now[5] + 1900,
				 $now[4] + 1,
				 @now[ 3, 2, 1, 0 ];
}
