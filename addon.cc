#include <nan.h>
extern "C" {
  #include "sha1.h"
}

using namespace v8;

// void CreateObject(const Nan::FunctionCallbackInfo<v8::Value>& info) {
//   info.GetReturnValue().Set(MyObject::NewInstance(info[0]));
// }

// void Add(const Nan::FunctionCallbackInfo<v8::Value>& info) {
//   MyObject* obj1 = Nan::ObjectWrap::Unwrap<MyObject>(info[0]->ToObject());
//   MyObject* obj2 = Nan::ObjectWrap::Unwrap<MyObject>(info[1]->ToObject());
//   double sum = obj1->Val() + obj2->Val();
//   info.GetReturnValue().Set(Nan::New(sum));
// }

void Check(const Nan::FunctionCallbackInfo<v8::Value>& info) {

		unsigned char hash2[20];
		char buffer[65536];
		size_t size;
		SHA1_CTX ctx2;
		int j;

		SHA1DCInit(&ctx2);
		FILE* fd = fopen("./README.md", "rb");
		if (fd == NULL)
		{
			printf("cannot open file");
			return;
		}

		// feed file through SHA-1 update function
		while (1)
		{
			size=fread(buffer,1,65536,fd);
			SHA1DCUpdate(&ctx2, buffer, (unsigned)(size));
			if (size != 65536)
				break;
		}
		if (ferror(fd))
		{
			printf("error while reading file\n");
			return;
		}
		if (!feof(fd))
		{
			printf("not end of file?\n");
			return;
		}
		//
		// // obtain SHA-1 and print it
		SHA1DCFinal(hash2,&ctx2);
		for (j = 0; j < 20; ++j)
		{
			sprintf(buffer+(j*2), "%02x", hash2[j]);
		}
		buffer[20*2] = 0;
		if (ctx2.found_collision)
		{
			printf("collision");
		}
		else
		{
			printf("no collision");
		}

		fclose(fd);
  	info.GetReturnValue().Set(Nan::New(1));
}

void InitAll(v8::Local<v8::Object> exports) {
  // MyObject::Init();

  // exports->Set(Nan::New("createObject").ToLocalChecked(),
  //     Nan::New<v8::FunctionTemplate>(CreateObject)->GetFunction());

  exports->Set(Nan::New("check").ToLocalChecked(),
      Nan::New<v8::FunctionTemplate>(Check)->GetFunction());

  // exports->Set(Nan::New("add").ToLocalChecked(),
  //     Nan::New<v8::FunctionTemplate>(Add)->GetFunction());
}

NODE_MODULE(addon, InitAll)
