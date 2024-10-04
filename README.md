# Delphi-AES
This repositry contains delphi implementation of AES algorithm. Originally this was developed by Alexander Ionov (EldoS) in 2001 when Github wasn't exists. So this file doesn't published anywhere at Github and I think that this implementation of AES is still actual and must live. I have no contact of Alexander but this that he'll be against it because more that 20 years passed.

ElAES.pas contains only 1 fix from me -  I've replaced the LongWord type with UInt32, because in Win32 and Win64 size of LongWord is 4 bytes and in Linux64 - 8 bytes. ElAES use pointers and SizeOf and with LongWord it causes Segmantation fault error.
