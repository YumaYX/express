default:
	cat makefile

clean:
	rm -rf _posts
	mkdir -p _posts
	git checkout -f _posts

pub:
	git pull
	-make clean
	git add .
	sleep 5
	git commit -am 'update'
	git push
