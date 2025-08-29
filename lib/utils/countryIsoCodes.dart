final Map<String, String> dialCodeToISO = {
  '+93': 'AF', // Afghanistan
  '+355': 'AL', // Albania
  '+213': 'DZ', // Algeria
  '+376': 'AD', // Andorra
  '+244': 'AO', // Angola
  '+1-264': 'AI', // Anguilla
  '+672': 'AQ', // Antarctica
  '+54': 'AR', // Argentina
  '+374': 'AM', // Armenia
  '+297': 'AW', // Aruba
  '+61': 'AU', // Australia
  '+43': 'AT', // Austria
  '+994': 'AZ', // Azerbaijan
  '+973': 'BH', // Bahrain
  '+880': 'BD', // Bangladesh
  '+1-246': 'BB', // Barbados
  '+375': 'BY', // Belarus
  '+32': 'BE', // Belgium
  '+501': 'BZ', // Belize
  '+229': 'BJ', // Benin
  '+975': 'BT', // Bhutan
  '+591': 'BO', // Bolivia
  '+387': 'BA', // Bosnia and Herzegovina
  '+267': 'BW', // Botswana
  '+55': 'BR', // Brazil
  '+246': 'IO', // British Indian Ocean Territory
  '+673': 'BN', // Brunei
  '+359': 'BG', // Bulgaria
  '+226': 'BF', // Burkina Faso
  '+257': 'BI', // Burundi
  '+855': 'KH', // Cambodia
  '+237': 'CM', // Cameroon
  '+1': 'CA', // Canada
  '+238': 'CV', // Cape Verde
  '+236': 'CF', // Central African Republic
  '+235': 'TD', // Chad
  '+56': 'CL', // Chile
  '+86': 'CN', // China
  '+57': 'CO', // Colombia
  '+269': 'KM', // Comoros
  '+242': 'CG', // Congo
  '+243': 'CD', // Congo (DRC)
  '+682': 'CK', // Cook Islands
  '+506': 'CR', // Costa Rica
  '+225': 'CI', // Côte d’Ivoire
  '+385': 'HR', // Croatia
  '+53': 'CU', // Cuba
  '+357': 'CY', // Cyprus
  '+420': 'CZ', // Czechia
  '+45': 'DK', // Denmark
  '+253': 'DJ', // Djibouti
  '+1-767': 'DM', // Dominica
  '+1-809': 'DO', // Dominican Republic
  '+593': 'EC', // Ecuador
  '+20': 'EG', // Egypt
  '+503': 'SV', // El Salvador
  '+240': 'GQ', // Equatorial Guinea
  '+291': 'ER', // Eritrea
  '+372': 'EE', // Estonia
  '+251': 'ET', // Ethiopia
  '+679': 'FJ', // Fiji
  '+358': 'FI', // Finland
  '+33': 'FR', // France
  '+241': 'GA', // Gabon
  '+220': 'GM', // Gambia
  '+995': 'GE', // Georgia
  '+49': 'DE', // Germany
  '+233': 'GH', // Ghana
  '+30': 'GR', // Greece
  '+299': 'GL', // Greenland
  '+1-473': 'GD', // Grenada
  '+502': 'GT', // Guatemala
  '+224': 'GN', // Guinea
  '+245': 'GW', // Guinea-Bissau
  '+592': 'GY', // Guyana
  '+509': 'HT', // Haiti
  '+504': 'HN', // Honduras
  '+852': 'HK', // Hong Kong
  '+36': 'HU', // Hungary
  '+354': 'IS', // Iceland
  '+91': 'IN', // India
  '+62': 'ID', // Indonesia
  '+98': 'IR', // Iran
  '+964': 'IQ', // Iraq
  '+353': 'IE', // Ireland
  '+972': 'IL', // Israel
  '+39': 'IT', // Italy
  '+1-876': 'JM', // Jamaica
  '+81': 'JP', // Japan
  '+962': 'JO', // Jordan
  '+7': 'KZ', // Kazakhstan
  '+254': 'KE', // Kenya
  '+686': 'KI', // Kiribati
  '+965': 'KW', // Kuwait
  '+996': 'KG', // Kyrgyzstan
  '+856': 'LA', // Laos
  '+371': 'LV', // Latvia
  '+961': 'LB', // Lebanon
  '+266': 'LS', // Lesotho
  '+231': 'LR', // Liberia
  '+218': 'LY', // Libya
  '+423': 'LI', // Liechtenstein
  '+370': 'LT', // Lithuania
  '+352': 'LU', // Luxembourg
  '+853': 'MO', // Macao
  '+389': 'MK', // North Macedonia
  '+261': 'MG', // Madagascar
  '+265': 'MW', // Malawi
  '+60': 'MY', // Malaysia
  '+960': 'MV', // Maldives
  '+223': 'ML', // Mali
  '+356': 'MT', // Malta
  '+692': 'MH', // Marshall Islands
  '+596': 'MQ', // Martinique
  '+222': 'MR', // Mauritania
  '+230': 'MU', // Mauritius
  '+262': 'RE', // Mayotte / Réunion
  '+52': 'MX', // Mexico
  '+691': 'FM', // Micronesia
  '+373': 'MD', // Moldova
  '+377': 'MC', // Monaco
  '+976': 'MN', // Mongolia
  '+382': 'ME', // Montenegro
  '+212': 'MA', // Morocco
  '+258': 'MZ', // Mozambique
  '+95': 'MM', // Myanmar
  '+264': 'NA', // Namibia
  '+674': 'NR', // Nauru
  '+977': 'NP', // Nepal
  '+31': 'NL', // Netherlands
  '+64': 'NZ', // New Zealand
  '+505': 'NI', // Nicaragua
  '+227': 'NE', // Niger
  '+234': 'NG', // Nigeria
  '+47': 'NO', // Norway
  '+968': 'OM', // Oman
  '+92': 'PK', // Pakistan
  '+680': 'PW', // Palau
  '+970': 'PS', // Palestine
  '+507': 'PA', // Panama
  '+675': 'PG', // Papua New Guinea
  '+595': 'PY', // Paraguay
  '+51': 'PE', // Peru
  '+63': 'PH', // Philippines
  '+48': 'PL', // Poland
  '+351': 'PT', // Portugal
  '+974': 'QA', // Qatar
  '+40': 'RO', // Romania
  '+7': 'RU', // Russia
  '+250': 'RW', // Rwanda
  '+590': 'BL', // Saint Barthélemy
  '+290': 'SH', // Saint Helena
  '+508': 'PM', // Saint Pierre and Miquelon
  '+685': 'WS', // Samoa
  '+378': 'SM', // San Marino
  '+239': 'ST', // Sao Tome and Principe
  '+966': 'SA', // Saudi Arabia
  '+221': 'SN', // Senegal
  '+381': 'RS', // Serbia
  '+248': 'SC', // Seychelles
  '+232': 'SL', // Sierra Leone
  '+65': 'SG', // Singapore
  '+421': 'SK', // Slovakia
  '+386': 'SI', // Slovenia
  '+677': 'SB', // Solomon Islands
  '+252': 'SO', // Somalia
  '+27': 'ZA', // South Africa
  '+82': 'KR', // South Korea
  '+211': 'SS', // South Sudan
  '+34': 'ES', // Spain
  '+94': 'LK', // Sri Lanka
  '+249': 'SD', // Sudan
  '+597': 'SR', // Suriname
  '+268': 'SZ', // Eswatini
  '+46': 'SE', // Sweden
  '+41': 'CH', // Switzerland
  '+963': 'SY', // Syria
  '+886': 'TW', // Taiwan
  '+992': 'TJ', // Tajikistan
  '+255': 'TZ', // Tanzania
  '+66': 'TH', // Thailand
  '+228': 'TG', // Togo
  '+676': 'TO', // Tonga
  '+1-868': 'TT', // Trinidad and Tobago
  '+216': 'TN', // Tunisia
  '+90': 'TR', // Turkey
  '+993': 'TM', // Turkmenistan
  '+688': 'TV', // Tuvalu
  '+256': 'UG', // Uganda
  '+380': 'UA', // Ukraine
  '+971': 'AE', // United Arab Emirates
  '+44': 'GB', // United Kingdom
  '+1': 'US', // United States
  '+598': 'UY', // Uruguay
  '+998': 'UZ', // Uzbekistan
  '+678': 'VU', // Vanuatu
  '+379': 'VA', // Vatican City
  '+58': 'VE', // Venezuela
  '+84': 'VN', // Vietnam
  '+681': 'WF', // Wallis and Futuna
  '+967': 'YE', // Yemen
  '+260': 'ZM', // Zambia
  '+263': 'ZW', // Zimbabwe
};
