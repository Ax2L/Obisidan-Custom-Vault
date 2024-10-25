import re

# Define the input and output file names
input_css_file = 'input.css'
output_css_file = 'output.css'

# Open the input CSS file and read its content
with open(input_css_file, 'r') as file:
    css_content = file.read()

# Split the content by closing braces to get individual CSS rules
css_rules = css_content.split('}')

# Prepare a regex pattern to match 'body' selectors
body_pattern = re.compile(r'\bbody\b[^{]*{', re.IGNORECASE)

# Filter out rules that contain 'body' selectors
non_body_rules = [rule for rule in css_rules if not body_pattern.search(rule)]

# Join the filtered rules back into a string
filtered_css_content = '}'.join(non_body_rules)

# Write the filtered CSS to the output file
with open(output_css_file, 'w') as file:
    file.write(filtered_css_content)

print(f"CSS without 'body' related rules has been written to {output_css_file}")