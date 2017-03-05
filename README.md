import sha1collision from 'sha1collision'

interface Context {
    reference: number
}

const buffer = ....

const context: Context = sha1collision.init()

sha1collision.update(buffer, context)

const res = sha1collision.final(context)

console.log(res.collision)
