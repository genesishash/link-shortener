# link-shortener
`link-shortener` is a quick url shortener with api. it will pass query strings through as well.

### create link
`http://localhost:10001/links?method=post&url=http%3A%2F%2Fnationalsolardepartment.com%2Fveteran.html%3Flp%3Dveteran%26note%3DXinyi_CV_Imgtest_Vet_6_TT_2%26sxid%3Da8ngjp37jy5x`

```js
{
    "ok": true,
    "response": {
        "__v": 0,
        "_id": "21akbzbfcpwi",
        "ctime": 1490134019,
        "mtime": 1490134019,
        "url": "http://nationalsolardepartment.com/veteran.html?lp=veteran&note=Xinyi_CV_Imgtest_Vet_6_TT_2&sxid=a8ngjp37jy5x",
        "active": true
    },
    "_meta": {
        "path": "/links",
        "body": {
            "url": "http://nationalsolardepartment.com/veteran.html?lp=veteran&note=Xinyi_CV_Imgtest_Vet_6_TT_2&sxid=a8ngjp37jy5x",
            "pretty": "1"
        },
        "query": {},
        "filter": {},
        "elapsed": 4
    }
}
```

### follow link
`http://localhost:10001/~21akbzbfcpwi`

