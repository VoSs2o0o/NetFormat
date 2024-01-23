unit NetFormat;

//Specifier C=Currency, D=Number, F=Float

interface

uses
  System.Generics.Collections;

  type
    TFormatSpecifier = class
    public
      rawString: string;
      fType: string;
      fLength: integer;

      function ValToStr<T>(val: T): string;
      function dtfType(): string;
    end;

    TNetFormat = class
    private
      class function _FillValues(const msg: string; vals: TList<string>;
                                          fmts: TList<TFormatSpecifier>): string;
      class function _getFormatspec(msg: string; idx: integer): TFormatSpecifier;
    public
      class function ToString(const msg: string): string;
                                                  reintroduce; overload;

      class function ToString<T1>(const msg: string; val1: T1): string;
                                                  reintroduce; overload;
      class function ToString<T1, T2>(const msg: string; val1: T1; val2: T2): string;
                                                               reintroduce; overload;

      class function ToString<T1, T2, T3>(const msg: string;
                      val1: T1; val2: T2; val3: T3): string;
                                                  reintroduce; overload;

      class function ToString<T1, T2, T3, T4>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4): string;
                                                  reintroduce; overload;

      class function ToString<T1, T2, T3, T4, T5>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5): string;
                                                               reintroduce; overload;

      class function ToString<T1, T2, T3, T4, T5, T6>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6): string; reintroduce; overload;

      class function ToString<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7): string; reintroduce; overload;

      class function ToString<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8): string;
                                                  reintroduce; overload;

      class function ToString<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8; val9: T9): string;
                                                              reintroduce; overload;
    end;

implementation

uses
   Winapi.Windows, System.TypInfo, System.SysUtils, System.Rtti, System.RegularExpressions;

   function TFormatSpecifier.ValToStr<T>(val: T): string;
   var
     ttypeInfo: PTypeInfo;
     tmpint: Int64;
     tmpdbl: double;
   begin
     ttypeInfo:= PTypeInfo(TypeInfo(T));
     if ttypeInfo.Kind in [tkInteger, tkInt64, tkFloat] then
        if self.fType = '' then
          if ttypeInfo.Name = 'TDateTime' then
             result:= DateToStr(TValue.From<T>(val).AsExtended())
          else
             result:= TValue.From<T>(val).ToString()
        else
        begin
          if self.fType.ToLower() = 'c' then
          begin;
            tmpdbl:= TValue.From<T>(val).AsExtended();
            result:=FloatToStrF(tmpdbl, ffCurrency, 10, fLength);
          end
          else if self.fType.ToLower() = 'd' then
          begin;
            if ttypeInfo.Kind = tkFloat then
              tmpint:= Round(TValue.From<T>(val).AsExtended())
            else
              tmpint:= TValue.From<T>(val).AsInt64();
            result:=Format('%' + IntToStr(fLength) + 'd',[tmpint]);
            result:= result.Replace(' ', '0');
          end
          else if self.fType.ToLower() = 'f' then
          begin;
            tmpdbl:= TValue.From<T>(val).AsExtended();
            result:=Format('%.' + IntToStr(fLength) + 'f',[tmpdbl])
          end
          else if ttypeInfo.Name = 'TDateTime' then
          begin
            tmpdbl:= TValue.From<T>(val).AsExtended;
            result:=FormatDateTime(self.dtfType(), tmpdbl)
          end
          else
            result:= TValue.From<T>(val).ToString();
        end
     else if ttypeInfo.Kind in [tkChar, tkString, tkClass,
                                tkWChar, tkWString, tkVariant, tkUString] then
        result:= TValue.From<T>(val).ToString()
     else
        result:= string(ttypeInfo.Name);
   end;

   function TFormatSpecifier.dtfType(): string;
   begin;
     result:= self.fType.Replace('m', 'n');
     //result:= TRegex.Replace(result, '(H{1,2})', '\1p');
     result:= TRegex.Replace(result, '(h{1,2})', '\1AM/PM');
   end;

   class function TNetFormat._FillValues(const msg: string; vals: TList<string>;
                                            fmts: TList<TFormatSpecifier>): string;
   var
      val: string;
      idx: integer;
      rawString: string;
   begin
      result:= msg;
      for idx:= 0 to 9 do
      begin
        if vals.Count > idx then
        begin
          val:= vals[idx];
          rawString:= fmts[idx].rawString;
        end
        else
        begin
          val:='';
          rawString:='{' + IntToStr(idx) + '}'
        end;
        result:= result.replace(rawString, val);
      end;

   end;

   class function TNetFormat.ToString(const msg: string): string;
   begin;
     result:= ToString(msg, nil, nil, nil, nil, nil, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1>(const msg: string; val1: T1): string;
   begin;
     result:= ToString(msg, val1, nil, nil, nil, nil, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2>(const msg: string; val1: T1; val2: T2): string;
   begin;
     result:= ToString(msg, val1, val2, nil, nil, nil, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3>(const msg: string;
                   val1: T1; val2: T2; val3: T3): string;
   begin;
     result:= ToString(msg, val1, val2, val3, nil, nil, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4): string;
   begin;
     result:= ToString(msg, val1, val2, val3, val4, nil, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4, T5>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4; val5: T5): string;
   begin;
     result:= ToString(msg, val1, val2, val3, val4, val5, nil, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4, T5, T6>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4; val5: T5; val6: T6): string;
   begin;
     result:= ToString(msg, val1, val2, val3, val4, val5, val6, nil, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4; val5: T5; val6: T6;
                   val7: T7): string;
   begin;
     result:= ToString(msg, val1, val2, val3, val4, val5, val6, val7, nil, nil);
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4; val5: T5; val6: T6;
                   val7: T7; val8: T8): string;
   begin;
     result:= ToString(msg, val1, val2, val3, val4, val5, val6, val7, val8, nil);
   end;

   class function TNetFormat._getFormatspec(msg: string; idx: integer): TFormatSpecifier;
   var
     pattern: string;
     match: TMatch;
   begin
     pattern:= '\{' + IntToStr(idx) + '(:(\w)?(\d)?)?\}';
     match:= TRegex.Match(msg, pattern);
     result:= TFormatSpecifier.Create();
     result.rawString:= match.Value;
     if match.Success then
     begin
        if match.Groups.Count > 2 then
          result.fType:= match.Groups[2].Value;
        if match.Groups.Count > 3 then
          result.fLength:= StrToInt(match.Groups[3].Value);
        exit;
     end;

     pattern:= '\{' + IntToStr(idx) + '(:([dMyHhms\/:. -]+))?\}';
     match:= TRegex.Match(msg, pattern);
     result.rawString:= match.Value;
     if match.Success then
     begin
        if match.Groups.Count > 2 then
          result.fType:= match.Groups[2].Value;
     end;
   end;

   class function TNetFormat.ToString<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                   val1: T1; val2: T2; val3: T3; val4: T4; val5: T5; val6: T6;
                   val7: T7; val8: T8; val9: T9): string;
   var
     vals: TList<string>;
     fmt: TFormatSpecifier;
     fmts: TList<TFormatSpecifier>;
   begin
     vals:= TList<string>.Create();
     fmts:= TList<TFormatSpecifier>.Create();
     if PPointer(@val1)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 0));
       vals.Add(fmts.Last().ValToStr<T1>(val1));
     end;
     if PPointer(@val2)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 1));
       vals.Add(fmts.Last().ValToStr<T2>(val2));
     end;
     if PPointer(@val3)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 2));
       vals.Add(fmts.Last().ValToStr<T3>(val3));
     end;
     if PPointer(@val4)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 3));
       vals.Add(fmts.Last().ValToStr<T4>(val4));
     end;
     if PPointer(@val5)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 4));
       vals.Add(fmts.Last().ValToStr<T5>(val5));
     end;
     if PPointer(@val6)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 5));
       vals.Add(fmts.Last().ValToStr<T6>(val6));
     end;
     if PPointer(@val7)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 6));
       vals.Add(fmts.Last().ValToStr<T7>(val7));
     end;
     if PPointer(@val8)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 7));
       vals.Add(fmts.Last().ValToStr<T8>(val8));
     end;
     if PPointer(@val9)^ <> nil then
     begin
       fmts.Add(_getFormatspec(msg, 8));
       vals.Add(fmts.Last().ValToStr<T9>(val9));
     end;

     result:= _FillValues(msg, vals, fmts);
     //OutputDebugString(PWideChar(res));
   end;
end.
