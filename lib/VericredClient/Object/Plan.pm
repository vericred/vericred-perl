package VericredClient::Object::Plan;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;

use base ("Class::Accessor", "Class::Data::Inheritable");


#
#
#
#NOTE: This class is auto generated by the swagger code generator program. Do not edit the class manually.
#

__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('swagger_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {}); 
__PACKAGE__->mk_classdata('class_documentation' => {});

# new object
sub new { 
    my ($class, %args) = @_; 

	my $self = bless {}, $class;
	
	foreach my $attribute (keys %{$class->attribute_map}) {
		my $args_key = $class->attribute_map->{$attribute};
		$self->$attribute( $args{ $args_key } );
	}
	
	return $self;
}  

# return perl hash
sub to_hash {
    return decode_json(JSON->new->convert_blessed->encode( shift ));
}

# used by JSON for serialization
sub TO_JSON { 
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }
    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use swagger_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->swagger_types} ) {
    	my $_json_attribute = $self->attribute_map->{$_key}; 
        if ($_type =~ /^array\[/i) { # array
            my $_subclass = substr($_type, 6, -1);
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
        	$log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }
  
    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);
        
    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "VericredClient::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}



__PACKAGE__->class_documentation({description => '',
                                  class => 'Plan',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'adult_dental' => {
    	datatype => 'boolean',
    	base_name => 'adult_dental',
    	description => 'Does the plan provide dental coverage for adults?',
    	format => '',
    	read_only => '',
    		},
    'ambulance' => {
    	datatype => 'string',
    	base_name => 'ambulance',
    	description => 'Benefits string for ambulance coverage',
    	format => '',
    	read_only => '',
    		},
    'benefits_summary_url' => {
    	datatype => 'string',
    	base_name => 'benefits_summary_url',
    	description => 'Link to the summary of benefits and coverage (SBC) document.',
    	format => '',
    	read_only => '',
    		},
    'buy_link' => {
    	datatype => 'string',
    	base_name => 'buy_link',
    	description => 'Link to a location to purchase the plan.',
    	format => '',
    	read_only => '',
    		},
    'carrier_name' => {
    	datatype => 'string',
    	base_name => 'carrier_name',
    	description => 'Name of the insurance carrier',
    	format => '',
    	read_only => '',
    		},
    'child_dental' => {
    	datatype => 'boolean',
    	base_name => 'child_dental',
    	description => 'Does the plan provide dental coverage for children?',
    	format => '',
    	read_only => '',
    		},
    'child_eyewear' => {
    	datatype => 'string',
    	base_name => 'child_eyewear',
    	description => 'Child eyewear benefits summary',
    	format => '',
    	read_only => '',
    		},
    'child_eye_exam' => {
    	datatype => 'string',
    	base_name => 'child_eye_exam',
    	description => 'Child eye exam benefits summary',
    	format => '',
    	read_only => '',
    		},
    'customer_service_phone_number' => {
    	datatype => 'string',
    	base_name => 'customer_service_phone_number',
    	description => 'Phone number to contact the insurance carrier',
    	format => '',
    	read_only => '',
    		},
    'durable_medical_equipment' => {
    	datatype => 'string',
    	base_name => 'durable_medical_equipment',
    	description => 'Benefits summary for durable medical equipment',
    	format => '',
    	read_only => '',
    		},
    'diagnostic_test' => {
    	datatype => 'string',
    	base_name => 'diagnostic_test',
    	description => 'Diagnostic tests benefit summary',
    	format => '',
    	read_only => '',
    		},
    'drug_formulary_url' => {
    	datatype => 'string',
    	base_name => 'drug_formulary_url',
    	description => 'Link to the summary of drug benefits for the plan',
    	format => '',
    	read_only => '',
    		},
    'effective_date' => {
    	datatype => 'string',
    	base_name => 'effective_date',
    	description => 'Effective date of coverage.',
    	format => '',
    	read_only => '',
    		},
    'expiration_date' => {
    	datatype => 'string',
    	base_name => 'expiration_date',
    	description => 'Expiration date of coverage.',
    	format => '',
    	read_only => '',
    		},
    'emergency_room' => {
    	datatype => 'string',
    	base_name => 'emergency_room',
    	description => 'Description of costs when visiting the ER',
    	format => '',
    	read_only => '',
    		},
    'family_drug_deductible' => {
    	datatype => 'string',
    	base_name => 'family_drug_deductible',
    	description => 'Deductible for drugs when a family is on the plan.',
    	format => '',
    	read_only => '',
    		},
    'family_drug_moop' => {
    	datatype => 'string',
    	base_name => 'family_drug_moop',
    	description => 'Maximum out-of-pocket for drugs when a family is on the plan',
    	format => '',
    	read_only => '',
    		},
    'family_medical_deductible' => {
    	datatype => 'string',
    	base_name => 'family_medical_deductible',
    	description => 'Deductible when a family is on the plan',
    	format => '',
    	read_only => '',
    		},
    'family_medical_moop' => {
    	datatype => 'string',
    	base_name => 'family_medical_moop',
    	description => 'Maximum out-of-pocket when a family is on the plan',
    	format => '',
    	read_only => '',
    		},
    'generic_drugs' => {
    	datatype => 'string',
    	base_name => 'generic_drugs',
    	description => 'Cost for generic drugs',
    	format => '',
    	read_only => '',
    		},
    'habilitation_services' => {
    	datatype => 'string',
    	base_name => 'habilitation_services',
    	description => 'Habilitation services benefits summary',
    	format => '',
    	read_only => '',
    		},
    'hios_issuer_id' => {
    	datatype => 'string',
    	base_name => 'hios_issuer_id',
    	description => '',
    	format => '',
    	read_only => '',
    		},
    'home_health_care' => {
    	datatype => 'string',
    	base_name => 'home_health_care',
    	description => 'Home health care benefits summary',
    	format => '',
    	read_only => '',
    		},
    'hospice_service' => {
    	datatype => 'string',
    	base_name => 'hospice_service',
    	description => 'Hospice service benefits summary',
    	format => '',
    	read_only => '',
    		},
    'id' => {
    	datatype => 'string',
    	base_name => 'id',
    	description => 'Government-issued HIOS plan ID',
    	format => '',
    	read_only => '',
    		},
    'imaging' => {
    	datatype => 'string',
    	base_name => 'imaging',
    	description => 'Benefits summary for imaging coverage',
    	format => '',
    	read_only => '',
    		},
    'in_network_ids' => {
    	datatype => 'ARRAY[int]',
    	base_name => 'in_network_ids',
    	description => 'List of NPI numbers for Providers passed in who accept this Plan',
    	format => '',
    	read_only => '',
    		},
    'individual_drug_deductible' => {
    	datatype => 'string',
    	base_name => 'individual_drug_deductible',
    	description => 'Deductible for drugs when an individual is on the plan',
    	format => '',
    	read_only => '',
    		},
    'individual_drug_moop' => {
    	datatype => 'string',
    	base_name => 'individual_drug_moop',
    	description => 'Maximum out-of-pocket for drugs when an individual is on the plan',
    	format => '',
    	read_only => '',
    		},
    'individual_medical_deductible' => {
    	datatype => 'string',
    	base_name => 'individual_medical_deductible',
    	description => 'Deductible when an individual is on the plan',
    	format => '',
    	read_only => '',
    		},
    'individual_medical_moop' => {
    	datatype => 'string',
    	base_name => 'individual_medical_moop',
    	description => 'Maximum out-of-pocket when an individual is on the plan',
    	format => '',
    	read_only => '',
    		},
    'inpatient_birth' => {
    	datatype => 'string',
    	base_name => 'inpatient_birth',
    	description => 'Inpatient birth benefits summary',
    	format => '',
    	read_only => '',
    		},
    'inpatient_facility' => {
    	datatype => 'string',
    	base_name => 'inpatient_facility',
    	description => 'Cost under the plan for an inpatient facility',
    	format => '',
    	read_only => '',
    		},
    'inpatient_mental_health' => {
    	datatype => 'string',
    	base_name => 'inpatient_mental_health',
    	description => 'Inpatient mental helath benefits summary',
    	format => '',
    	read_only => '',
    		},
    'inpatient_physician' => {
    	datatype => 'string',
    	base_name => 'inpatient_physician',
    	description => 'Cost under the plan for an inpatient physician',
    	format => '',
    	read_only => '',
    		},
    'inpatient_substance' => {
    	datatype => 'string',
    	base_name => 'inpatient_substance',
    	description => 'Inpatient substance abuse benefits summary',
    	format => '',
    	read_only => '',
    		},
    'level' => {
    	datatype => 'string',
    	base_name => 'level',
    	description => 'Plan metal grouping (e.g. platinum, gold, silver, etc)',
    	format => '',
    	read_only => '',
    		},
    'logo_url' => {
    	datatype => 'string',
    	base_name => 'logo_url',
    	description => 'Link to a copy of the insurance carrier&#39;s logo',
    	format => '',
    	read_only => '',
    		},
    'name' => {
    	datatype => 'string',
    	base_name => 'name',
    	description => 'Marketing name of the plan',
    	format => '',
    	read_only => '',
    		},
    'network_size' => {
    	datatype => 'int',
    	base_name => 'network_size',
    	description => 'Total number of Providers in network',
    	format => '',
    	read_only => '',
    		},
    'non_preferred_brand_drugs' => {
    	datatype => 'string',
    	base_name => 'non_preferred_brand_drugs',
    	description => 'Cost under the plan for non-preferred brand drugs',
    	format => '',
    	read_only => '',
    		},
    'on_market' => {
    	datatype => 'boolean',
    	base_name => 'on_market',
    	description => 'Is the plan on-market?',
    	format => '',
    	read_only => '',
    		},
    'off_market' => {
    	datatype => 'boolean',
    	base_name => 'off_market',
    	description => 'Is the plan off-market?',
    	format => '',
    	read_only => '',
    		},
    'out_of_network_coverage' => {
    	datatype => 'boolean',
    	base_name => 'out_of_network_coverage',
    	description => 'Does this plan provide any out of network coverage?',
    	format => '',
    	read_only => '',
    		},
    'out_of_network_ids' => {
    	datatype => 'ARRAY[int]',
    	base_name => 'out_of_network_ids',
    	description => 'List of NPI numbers for Providers passed in who do not accept this Plan',
    	format => '',
    	read_only => '',
    		},
    'outpatient_facility' => {
    	datatype => 'string',
    	base_name => 'outpatient_facility',
    	description => 'Benefits summary for outpatient facility coverage',
    	format => '',
    	read_only => '',
    		},
    'outpatient_mental_health' => {
    	datatype => 'string',
    	base_name => 'outpatient_mental_health',
    	description => 'Benefits summary for outpatient mental health coverage',
    	format => '',
    	read_only => '',
    		},
    'outpatient_physician' => {
    	datatype => 'string',
    	base_name => 'outpatient_physician',
    	description => 'Benefits summary for outpatient physician coverage',
    	format => '',
    	read_only => '',
    		},
    'outpatient_substance' => {
    	datatype => 'string',
    	base_name => 'outpatient_substance',
    	description => 'Outpatient substance abuse benefits summary',
    	format => '',
    	read_only => '',
    		},
    'plan_market' => {
    	datatype => 'string',
    	base_name => 'plan_market',
    	description => 'Market in which the plan is offered (on_marketplace, shop, etc)',
    	format => '',
    	read_only => '',
    		},
    'plan_type' => {
    	datatype => 'string',
    	base_name => 'plan_type',
    	description => 'Category of the plan (e.g. EPO, HMO, PPO, POS, Indemnity)',
    	format => '',
    	read_only => '',
    		},
    'preferred_brand_drugs' => {
    	datatype => 'string',
    	base_name => 'preferred_brand_drugs',
    	description => 'Cost under the plan for perferred brand drugs',
    	format => '',
    	read_only => '',
    		},
    'prenatal_postnatal_care' => {
    	datatype => 'string',
    	base_name => 'prenatal_postnatal_care',
    	description => 'Inpatient substance abuse benefits summary',
    	format => '',
    	read_only => '',
    		},
    'preventative_care' => {
    	datatype => 'string',
    	base_name => 'preventative_care',
    	description => 'Benefits summary for preventative care',
    	format => '',
    	read_only => '',
    		},
    'premium_subsidized' => {
    	datatype => 'Number',
    	base_name => 'premium_subsidized',
    	description => 'Cumulative premium amount after subsidy',
    	format => '',
    	read_only => '',
    		},
    'premium' => {
    	datatype => 'Number',
    	base_name => 'premium',
    	description => 'Cumulative premium amount',
    	format => '',
    	read_only => '',
    		},
    'primary_care_physician' => {
    	datatype => 'string',
    	base_name => 'primary_care_physician',
    	description => 'Cost under the plan to visit a Primary Care Physician',
    	format => '',
    	read_only => '',
    		},
    'rehabilitation_services' => {
    	datatype => 'string',
    	base_name => 'rehabilitation_services',
    	description => 'Benefits summary for rehabilitation services',
    	format => '',
    	read_only => '',
    		},
    'skilled_nursing' => {
    	datatype => 'string',
    	base_name => 'skilled_nursing',
    	description => 'Benefits summary for skilled nursing services',
    	format => '',
    	read_only => '',
    		},
    'specialist' => {
    	datatype => 'string',
    	base_name => 'specialist',
    	description => 'Cost under the plan to visit a specialist',
    	format => '',
    	read_only => '',
    		},
    'specialty_drugs' => {
    	datatype => 'string',
    	base_name => 'specialty_drugs',
    	description => 'Cost under the plan for specialty drugs',
    	format => '',
    	read_only => '',
    		},
    'urgent_care' => {
    	datatype => 'string',
    	base_name => 'urgent_care',
    	description => 'Benefits summary for urgent care',
    	format => '',
    	read_only => '',
    		},
});

__PACKAGE__->swagger_types( {
    'adult_dental' => 'boolean',
    'ambulance' => 'string',
    'benefits_summary_url' => 'string',
    'buy_link' => 'string',
    'carrier_name' => 'string',
    'child_dental' => 'boolean',
    'child_eyewear' => 'string',
    'child_eye_exam' => 'string',
    'customer_service_phone_number' => 'string',
    'durable_medical_equipment' => 'string',
    'diagnostic_test' => 'string',
    'drug_formulary_url' => 'string',
    'effective_date' => 'string',
    'expiration_date' => 'string',
    'emergency_room' => 'string',
    'family_drug_deductible' => 'string',
    'family_drug_moop' => 'string',
    'family_medical_deductible' => 'string',
    'family_medical_moop' => 'string',
    'generic_drugs' => 'string',
    'habilitation_services' => 'string',
    'hios_issuer_id' => 'string',
    'home_health_care' => 'string',
    'hospice_service' => 'string',
    'id' => 'string',
    'imaging' => 'string',
    'in_network_ids' => 'ARRAY[int]',
    'individual_drug_deductible' => 'string',
    'individual_drug_moop' => 'string',
    'individual_medical_deductible' => 'string',
    'individual_medical_moop' => 'string',
    'inpatient_birth' => 'string',
    'inpatient_facility' => 'string',
    'inpatient_mental_health' => 'string',
    'inpatient_physician' => 'string',
    'inpatient_substance' => 'string',
    'level' => 'string',
    'logo_url' => 'string',
    'name' => 'string',
    'network_size' => 'int',
    'non_preferred_brand_drugs' => 'string',
    'on_market' => 'boolean',
    'off_market' => 'boolean',
    'out_of_network_coverage' => 'boolean',
    'out_of_network_ids' => 'ARRAY[int]',
    'outpatient_facility' => 'string',
    'outpatient_mental_health' => 'string',
    'outpatient_physician' => 'string',
    'outpatient_substance' => 'string',
    'plan_market' => 'string',
    'plan_type' => 'string',
    'preferred_brand_drugs' => 'string',
    'prenatal_postnatal_care' => 'string',
    'preventative_care' => 'string',
    'premium_subsidized' => 'Number',
    'premium' => 'Number',
    'primary_care_physician' => 'string',
    'rehabilitation_services' => 'string',
    'skilled_nursing' => 'string',
    'specialist' => 'string',
    'specialty_drugs' => 'string',
    'urgent_care' => 'string'
} );

__PACKAGE__->attribute_map( {
    'adult_dental' => 'adult_dental',
    'ambulance' => 'ambulance',
    'benefits_summary_url' => 'benefits_summary_url',
    'buy_link' => 'buy_link',
    'carrier_name' => 'carrier_name',
    'child_dental' => 'child_dental',
    'child_eyewear' => 'child_eyewear',
    'child_eye_exam' => 'child_eye_exam',
    'customer_service_phone_number' => 'customer_service_phone_number',
    'durable_medical_equipment' => 'durable_medical_equipment',
    'diagnostic_test' => 'diagnostic_test',
    'drug_formulary_url' => 'drug_formulary_url',
    'effective_date' => 'effective_date',
    'expiration_date' => 'expiration_date',
    'emergency_room' => 'emergency_room',
    'family_drug_deductible' => 'family_drug_deductible',
    'family_drug_moop' => 'family_drug_moop',
    'family_medical_deductible' => 'family_medical_deductible',
    'family_medical_moop' => 'family_medical_moop',
    'generic_drugs' => 'generic_drugs',
    'habilitation_services' => 'habilitation_services',
    'hios_issuer_id' => 'hios_issuer_id',
    'home_health_care' => 'home_health_care',
    'hospice_service' => 'hospice_service',
    'id' => 'id',
    'imaging' => 'imaging',
    'in_network_ids' => 'in_network_ids',
    'individual_drug_deductible' => 'individual_drug_deductible',
    'individual_drug_moop' => 'individual_drug_moop',
    'individual_medical_deductible' => 'individual_medical_deductible',
    'individual_medical_moop' => 'individual_medical_moop',
    'inpatient_birth' => 'inpatient_birth',
    'inpatient_facility' => 'inpatient_facility',
    'inpatient_mental_health' => 'inpatient_mental_health',
    'inpatient_physician' => 'inpatient_physician',
    'inpatient_substance' => 'inpatient_substance',
    'level' => 'level',
    'logo_url' => 'logo_url',
    'name' => 'name',
    'network_size' => 'network_size',
    'non_preferred_brand_drugs' => 'non_preferred_brand_drugs',
    'on_market' => 'on_market',
    'off_market' => 'off_market',
    'out_of_network_coverage' => 'out_of_network_coverage',
    'out_of_network_ids' => 'out_of_network_ids',
    'outpatient_facility' => 'outpatient_facility',
    'outpatient_mental_health' => 'outpatient_mental_health',
    'outpatient_physician' => 'outpatient_physician',
    'outpatient_substance' => 'outpatient_substance',
    'plan_market' => 'plan_market',
    'plan_type' => 'plan_type',
    'preferred_brand_drugs' => 'preferred_brand_drugs',
    'prenatal_postnatal_care' => 'prenatal_postnatal_care',
    'preventative_care' => 'preventative_care',
    'premium_subsidized' => 'premium_subsidized',
    'premium' => 'premium',
    'primary_care_physician' => 'primary_care_physician',
    'rehabilitation_services' => 'rehabilitation_services',
    'skilled_nursing' => 'skilled_nursing',
    'specialist' => 'specialist',
    'specialty_drugs' => 'specialty_drugs',
    'urgent_care' => 'urgent_care'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
