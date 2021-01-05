
sass:
	# インストールされたjsモジュールを全部消す
	rm -rf node_modules
	# インストールされたjsモジュールのバージョン情報を消す
	rm package-lock.json
	# npmのキャッシュをクリアする
	npm cache clear --force
	# 再度jsモジュールを全部入れ直して、実行する
	npm install
	npm run dev

heroku-login:
	heroku login --interactive

heroku-db:
	heroku create --buildpack heroku/php
	heroku addons:create heroku-postgresql:hobby-dev


	heroku config:set DB_USERNAME=moqhuzukbiwrmi DB_PASSWORD=b909dc699b131a14b7d56d789f8bd7ea176b8af5ae25671463fa0cb96ce7d6c0 DB_CONNECTION=ec2-18-232-232-96.compute-1.amazonaws.com DB_PORT=5432 DB_DATABASE=d7gn0via6n79cv
	heroku config:set APP_KEY=$(php server/sample/artisan --no-ansi key:generate --show)

	# サブディレクトリをプッシュ
	git subtree push --prefix server/sample/ heroku master
