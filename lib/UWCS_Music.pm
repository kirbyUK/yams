package UWCS_Music;
use Dancer2;
use JSON qw/encode_json decode_json/;

our $VERSION = '0.1';

our $BUCKET_FILE = "./public/bucket.json";

# Open the buckets:
sub get_buckets
{
	# Load the buckets:
	open my $file, '<', $BUCKET_FILE
		or warn "Cannot open file '$BUCKET_FILE': $!\n";	

	# Slurp the file:
	my $json;
	{
		local $/;
		$json = <$file>;
	}

	# Decode the JSON:
	return decode_json $json;
}

# Write the given buckets:
sub write_buckets
{
	my $buckets = shift;

	# Open the file for writing:
	open my $file, '>', $BUCKET_FILE
		or warn "Cannot open file '$BUCKET_FILE': $!\n";

	# Write the JSON:
	print $file(encode_json $buckets);
}

get '/' => sub
{
    template 'index';
};

post '/request' => sub
{
	# Get the requested url:
	my $url = param('url');

	# Get the IP of the request:
	my $ip = request->address();

	print "Received request '$url' from '$ip\n'";

	# Get the bucket:
	my $buckets = get_buckets;

	# Find the next bucket which does not have this IP in:
	my $added = 0;
	foreach my $bucket(@{$buckets})
	{
		# If the IP is not given, add this entry to the current bucket:
		if(! defined $bucket->{"$ip"})
		{
			$bucket->{"$ip"} = $url;
			$added = 1;
			last;
		}
	}

	# If we did not add the request, we must need to make a new bucket:
	if(! $added)
	{
		push @{$buckets}, { "$ip" => $url };
	}

	# Write the new buckets:
	write_buckets $buckets;
};

true;
