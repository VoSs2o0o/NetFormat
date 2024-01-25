unit Debug;

interface
type
    TDebug = class
    public
      class procedure Print(const msg: string) overload;

      class procedure Print<T1>(const msg: string; val1: T1); overload;
      class procedure Print<T1, T2>(const msg: string; val1: T1; val2: T2);overload;

      class procedure Print<T1, T2, T3>(const msg: string;
                      val1: T1; val2: T2; val3: T3); overload;

      class procedure Print<T1, T2, T3, T4>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4); overload;

      class procedure Print<T1, T2, T3, T4, T5>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5);overload;

      class procedure Print<T1, T2, T3, T4, T5, T6>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6); overload;

      class procedure Print<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7); overload;

      class procedure Print<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8); overload;

      class procedure Print<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                      val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                      val6: T6; val7: T7; val8: T8; val9: T9); overload;
    end;
implementation

uses
  NetFormat, Winapi.Windows;

    class procedure TDebug.Print(const msg: string);
    var
      res: string;
    begin
      res:= TStr(msg).Params(nil, nil, nil, nil, nil, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1>(const msg: string; val1: T1);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, nil, nil, nil, nil, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2>(const msg: string; val1: T1; val2: T2);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, nil, nil, nil, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3>(const msg: string;
                                                  val1: T1; val2: T2; val3: T3);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, nil, nil, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4>(const msg: string;
                                        val1: T1; val2: T2; val3: T3; val4: T4);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, val4, nil, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4, T5>(const msg: string;
                              val1: T1; val2: T2; val3: T3; val4: T4; val5: T5);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, val4, val5, nil, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4, T5, T6>(const msg: string;
                               val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                               val6: T6);
   var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, val4, val5, val6, nil, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4, T5, T6, T7>(const msg: string;
                               val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                               val6: T6; val7: T7);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, val4, val5, val6, val7, nil, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4, T5, T6, T7, T8>(const msg: string;
                               val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                               val6: T6; val7: T7; val8: T8);
    var
      res: string;
    begin
      res:=TStr(msg).Params(val1, val2, val3, val4, val5, val6, val7, val8, nil);
      OutputDebugString(PWChar(res));
    end;

    class procedure TDebug.Print<T1, T2, T3, T4, T5, T6, T7, T8, T9>(const msg: string;
                               val1: T1; val2: T2; val3: T3; val4: T4; val5: T5;
                               val6: T6; val7: T7; val8: T8; val9: T9);
   var
     res: string;
   begin
     res:=TStr(msg).Params(val1, val2, val3, val4, val5, val6, val7, val8, val9);
     OutputDebugString(PWChar(res));
   end;
end.
