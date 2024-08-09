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
	quarto preview --profile website_fr 

en:
	quarto preview --profile website_en


