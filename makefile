build:
	echo "Rendering"
	quarto render --profile website_en
	quarto render --profile website_fr 

	echo "Adding"
	git add -A

	echo "Committing"
	git commit -m "new content ready"

	echo "Pushing"
	git push

fr:
	quarto render --profile website_fr 
	quarto render --profile website_fr 


