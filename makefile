build:
	echo "Rendering English ..."
	quarto render --profile website_en

	echo "Rendering French ..."
	quarto render --profile website_fr 

	echo "Adding ..."
	git add -A

	echo "Committing"
	git commit -m "new content ready"

	echo "Pushing ..."
	git push

	echo "Website is now being rendered by Netlify ..."

fr:
	quarto preview --profile website_fr 

en:
	quarto preview --profile website_en


