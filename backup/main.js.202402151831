//require(モジュール名)とすることでモジュールをロードする
const express = require('express');
const { createServer } = require('node:http');
const { join } = require('node:path');
const { Server } = require('socket.io');
//express関数を変数"app"に入れることで，appを使用したときにHTTPサーバを提供することができる
const app = express();
//createServer(app)でexpress関数を使用した
const server = createServer(app);
//外部ファイル読み込むFileSystemをロード
const fs = require('fs')
//Server(server)とすることでapp(express)のサーバを起動
const io = new Server(server);
const port = 48774;

//web siteのhome(:3000にアクセスしたとき)に処理する動作
//(req, res)はリクエストとレスポンスを受け取るコールバック関数
app.get('/', (req, res) => {
	//responseの送信
	res.sendFile(join(__dirname, 'index.html'));
	//logに記載する内容
    console.log(`Sent a response: index.html`);
});

//io:socket.ioのインスタンス，on:イベントの受信者登録，connection:ユーザ接続時，(socket):connectionの正常終了を経て実行開始されるコールバック関数，socket:接続したユーザに関する情報及び接続に関するメソッド
io.on('connection', (socket) => {
	console.log('user connected');
	//切断処理時の処理
	socket.on('disconnect', () => {
	  console.log('user disconnected');
	});
  });

//このnodejsを待機させるportの指定(48774)
server.listen(port, () => {
	console.log(`running port: ${port}`)
});

io.on('connection', (socket) => {
	setInterval(() => {
		let tempRas24 = fs.readFileSync("/home/kimigayo/watch-temp-server/get-temp/temp24.txt", 'utf-8');
		socket.emit('getTempRas24', tempRas24);
		let tempRas25 = fs.readFileSync("/home/kimigayo/watch-temp-server/get-temp/temp25.txt", 'utf-8');
		socket.emit('getTempRas25', tempRas25);
		let tempRas26 = fs.readFileSync("/home/kimigayo/watch-temp-server/get-temp/temp26.txt", 'utf-8');
		socket.emit('getTempRas26', tempRas26);
	}, 3000)
});