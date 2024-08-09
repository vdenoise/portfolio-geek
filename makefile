build:
	echo "Rendering"
	quarto render --profile website_en
	quarto render --profile website_fr 

	echo "Adding"
	git add -A

	echo "Committing"
	git commit -m "new content ready"

	echo "Pushing"
	git commit -m "new content ready"

preview_fr:




