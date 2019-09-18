use strict;
use warnings;
use Data::Dumper;
use LWP::UserAgent;
use JSON;

# Create a user agent object
my $ua = LWP::UserAgent->new;

# Create a request
my $url = 'https://jsonplaceholder.typicode.com/users/1';
# GET request
my $req = HTTP::Request->new( GET => $url );
# $req->content_type('application/json');
# $req->authorization_basic("admin", "secret");

# Pass request to the user agent and get a response back
my $res = $ua->request( $req );

# Check result of the request
my $json_response = '[]';
if ( $res->is_success ) {
    $json_response = $res->content;

    # JSON object to decode json response into hash
    my $JSON = JSON->new;
    my $hash_response = $JSON->decode($json_response);

    print "JSON_RESPONSE: $json_response\n";
    print "HASH_RESPONSE: ".Dumper($hash_response);
    print "USERNAME: $hash_response->{username}\n"
} else {
    print "ERROR STATUS: ".$res->status_line."\n";
}


