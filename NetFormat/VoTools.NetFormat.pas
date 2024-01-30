unit VoTools.NetFormat;

//The NetFormat-Unit forwards to the FStr unit and provides an alternative to FStr.
//Use it to easily format a string in Delphi.
//Specifier C=Currency, D=Number, F=Float, X=Hex, further Infos in README.md

//VoSs2o0o (c) 2024, Apache 2.0 License

interface
uses
  System.SysUtils;

type

   TNetFormat = record
   private
      function _GetFmtSettings(): TFormatSettings;
      procedure _SetFmtSettings(val: TFormatSettings);
   public
      property formatsettings: TFormatSettings read _GetFmtSettings write _SetFmtSettings;

      function Str(const msg: string): string; overload;

      function Str<T1>(const msg: string; val1: T1): string;
                                                              overload;
      function Str<T1, T2>(const msg: string; val1: T1; val2: T2): string;
                                                              overload;

      function Str<T1, T2, T3>(const msg: string;
                      val1: T1; val2: T2; val3: T3): string;  overload;

      function Str<T1, T2, T3, T4>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4): string;
                                                              overload;

      function Str<T1, T2, T3, T4, T5>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5): string;
                                                              overload;

      function Str<T1, T2, T3, T4, T5, T6>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6): string;                      overload;

      function Str<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7): string;            overload;

      function Str<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8): string;
                                                              overload;

      function Str<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8; val9: T9): string;
                                                              overload;
   end;
implementation
uses
   VoTools.FStr;

   function TNetFormat.Str(const msg: string): string;
   begin;
     result:= FStr(msg).ToString();
   end;

   function TNetFormat.Str<T1>(const msg: string; val1: T1): string;
   begin;
     result:= FStr(msg).params(val1, nil, nil, nil, nil, nil, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2>(const msg: string; val1: T1; val2: T2): string;
   begin;
     result:= FStr(msg).params(val1, val2, nil, nil, nil, nil, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3>(const msg: string;
                      val1: T1; val2: T2; val3: T3): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, nil, nil, nil, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, nil, nil, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4, T5>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, val5, nil, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4, T5, T6>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, val5, val6, nil, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, val5, val6, val7, nil, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, val5, val6, val7, val8, nil);
   end;

   function TNetFormat.Str<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8; val9: T9): string;
   begin;
     result:= FStr(msg).params(val1, val2, val3, val4, val5, val6, val7, val8, val9);
   end;

   function TNetFormat._GetFmtSettings(): TFormatSettings;
   begin
     result:= FStr.formatsettings;
   end;
   procedure TNetFormat._SetFmtSettings(val: TFormatSettings);
   begin
     FStr.formatsettings:= val;
   end;
end.
