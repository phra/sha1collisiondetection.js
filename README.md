import sha1collision from 'sha1collision'

interface Context {
    reference: number
}

const buffer = ....

const context: Context = sha1collision.init()

sha1collision.update(buffer, context)

const res = sha1collision.final(context)

console.log(res.collision)

ln -s sha1dcsum bin/sha1dcsum_partialcoll
ln: creazione del collegamento simbolico 'bin/sha1dcsum_partialcoll' non riuscita: File già esistente
Makefile:150: set di istruzioni per l'obiettivo "sha1dcsum_partialcoll" non riuscito
make[1]: [sha1dcsum_partialcoll] Errore 1 (ignorato)
