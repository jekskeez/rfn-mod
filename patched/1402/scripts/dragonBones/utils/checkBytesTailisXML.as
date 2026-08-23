package dragonBones.utils
{
   import flash.utils.ByteArray;
   
   public function checkBytesTailisXML(param1:ByteArray) : Boolean
   {
      var _loc4_:* = 0;
      var _loc2_:* = int(param1.length);
      var _loc3_:* = 20;
      while(_loc3_--)
      {
         if(!_loc2_--)
         {
            continue;
         }
         switch(param1[_loc2_])
         {
            case charCodes[" "]:
            case charCodes["\t"]:
            case charCodes["\r"]:
            case charCodes["\n"]:
               break;
            case charCodes[">"]:
               _loc4_ = 20;
               while(_loc4_--)
               {
                  if(!_loc2_--)
                  {
                     break;
                  }
                  if(param1[_loc2_] == charCodes["<"])
                  {
                     return true;
                  }
               }
               return false;
         }
      }
      return false;
   }
}

var c:String;

const charCodes:Object = new Object();

for each(c in " \t\r\n<>".split(""))
{
   charCodes[c] = c.charCodeAt(0);
}

