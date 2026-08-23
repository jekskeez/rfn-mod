package buttons
{
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-Q1W§ extends SimpleButton
   {
      
      public static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,15,16777215),new TextFormat(§_-i5§.§_-p1s§,15,16768375),new TextFormat(§_-i5§.§_-p1s§,15,16763955)];
      
      public static const §_-Y2U§:Array = [new TextFormat(§_-i5§.§_-p1s§,14,16777215),new TextFormat(§_-i5§.§_-p1s§,14,16768375),new TextFormat(§_-i5§.§_-p1s§,14,16763955)];
      
      public function §_-Q1W§(param1:String, param2:Array = null, param3:Class = null, param4:int = -2, param5:int = 0, param6:Array = null)
      {
         var _loc11_:§_-i5§ = null;
         if(param2 == null)
         {
            param2 = §_-D12§;
         }
         if(param3 == null)
         {
            param3 = ButtonFooterTabBack;
         }
         var _loc7_:SimpleButton = new param3();
         var _loc8_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         _loc8_.push(_loc7_.upState,_loc7_.overState,_loc7_.downState);
         var _loc9_:Vector.<Sprite> = new Vector.<Sprite>();
         var _loc10_:int = 0;
         while(_loc10_ < _loc8_.length)
         {
            _loc9_.push(new Sprite());
            _loc11_ = new §_-i5§(param1,0,param4,param2[_loc10_]);
            _loc11_.x = int((_loc8_[_loc10_].width - _loc11_.textWidth) * 0.5) + param5;
            _loc11_.filters = param6;
            _loc9_[_loc10_].addChild(_loc8_[_loc10_]);
            _loc9_[_loc10_].addChild(_loc11_);
            _loc10_++;
         }
         super(_loc9_[0],_loc9_[1],_loc9_[2],_loc7_.hitTestState);
      }
   }
}

