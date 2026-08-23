package utils
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.getDefinitionByName;
   
   public class §_-jB§
   {
      
      public function §_-jB§()
      {
         super();
      }
      
      public static function §_-fG§(param1:TextField, param2:String, param3:Class, param4:Number, param5:Number, param6:int, param7:int, param8:Boolean, param9:Boolean = true) : Vector.<DisplayObject>
      {
         var _loc12_:Rectangle = null;
         var _loc13_:DisplayObject = null;
         var _loc10_:int = -1;
         var _loc11_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         while(true)
         {
            _loc10_ = param1.text.indexOf(param2,++_loc10_);
            if(_loc10_ == -1)
            {
               break;
            }
            _loc12_ = param1.getCharBoundaries(_loc10_);
            if(_loc12_ == null)
            {
               break;
            }
            _loc13_ = new param3() as DisplayObject;
            _loc13_.scaleX = param4;
            _loc13_.scaleY = param5;
            _loc13_.x = _loc12_.x - param6;
            _loc13_.y = _loc12_.y - param7;
            (_loc13_ as MovieClip).mouseEnabled = false;
            _loc11_.push(param1.parent.addChild(_loc13_));
            if(param9)
            {
               if(param8)
               {
                  param1.htmlText = param1.htmlText.replace(param2,"    ");
               }
               else
               {
                  param1.text = param1.text.replace(param2,"    ");
               }
            }
         }
         return _loc11_;
      }
      
      public static function §_-Y1f§(param1:TextField, param2:String, param3:DisplayObject, param4:Number, param5:Number, param6:int, param7:int, param8:Boolean, param9:Boolean = true) : Vector.<DisplayObject>
      {
         var _loc12_:Rectangle = null;
         var _loc10_:int = -1;
         var _loc11_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         while(true)
         {
            _loc10_ = param1.text.indexOf(param2,++_loc10_);
            if(_loc10_ == -1)
            {
               break;
            }
            _loc12_ = param1.getCharBoundaries(_loc10_);
            if(_loc12_ == null)
            {
               break;
            }
            param3.scaleX = param4;
            param3.scaleY = param5;
            param3.x = _loc12_.x - param6;
            param3.y = _loc12_.y - param7;
            if(param3 is MovieClip)
            {
               (param3 as MovieClip).mouseEnabled = false;
            }
            _loc11_.push(param1.parent.addChild(param3));
            if(param9)
            {
               if(param8)
               {
                  param1.htmlText = param1.htmlText.replace(param2,"    ");
               }
               else
               {
                  param1.text = param1.text.replace(param2,"    ");
               }
            }
         }
         return _loc11_;
      }
      
      public static function §_-Y2B§(param1:TextField, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Rectangle = null;
         var _loc7_:DisplayObject = null;
         var _loc8_:int = 0;
         while(true)
         {
            _loc3_ = -1;
            _loc4_ = -1;
            _loc5_ = 0;
            while(_loc5_ < param2.length)
            {
               _loc8_ = param1.text.indexOf(param2[_loc5_]["replaceString"]);
               if(_loc8_ != -1)
               {
                  if(_loc3_ == -1 || _loc3_ > _loc8_)
                  {
                     _loc3_ = _loc8_;
                     _loc4_ = _loc5_;
                  }
               }
               _loc5_++;
            }
            if(_loc3_ == -1)
            {
               break;
            }
            _loc6_ = param1.getCharBoundaries(_loc3_);
            if(_loc6_ == null)
            {
               return;
            }
            _loc7_ = new param2[_loc4_]["imageClass"]() as DisplayObject;
            _loc7_.scaleX = param2[_loc4_]["scaleX"];
            _loc7_.scaleY = param2[_loc4_]["scaleY"];
            _loc7_.x = _loc6_.x - param2[_loc4_]["shiftX"];
            _loc7_.y = _loc6_.y - param2[_loc4_]["shiftY"];
            param1.parent.addChild(_loc7_);
            if("replace" in param2[_loc4_])
            {
               if(!param2[_loc4_]["replace"])
               {
                  continue;
               }
            }
            if(param2[_loc4_]["isHtml"])
            {
               param1.htmlText = param1.htmlText.replace(param2[_loc4_]["replaceString"],"    ");
            }
            else
            {
               param1.text = param1.text.replace(param2[_loc4_]["replaceString"],"    ");
            }
         }
      }
   }
}

