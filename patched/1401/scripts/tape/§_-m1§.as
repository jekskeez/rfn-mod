package tape
{
   import §_-68§.§_-EI§;
   import §_-I10§.§_-S16§;
   import §_-T2y§.§_-92z§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-m1§ extends §_-xc§
   {
      
      private static var §_-S8§:Object = {};
      
      §_-S8§[§_-q1p§.§_-C25§] = "ButtonLocation1";
      §_-S8§[§_-q1p§.§_-sL§] = "ButtonLocation3";
      §_-S8§[§_-q1p§.§_-P4§] = "ButtonLocation4";
      §_-S8§[§_-q1p§.§_-u2u§] = "ButtonLocation5";
      §_-S8§[§_-q1p§.§_-A3z§] = "ButtonLocation8";
      §_-S8§[§_-q1p§.§_-M1m§] = "ButtonLocation7";
      §_-S8§[§_-q1p§.§_-Q1s§] = "ButtonLocation6";
      §_-S8§[§_-q1p§.§_-w2u§] = "ButtonLocation1";
      §_-S8§[§_-q1p§.§_-k2B§] = "ButtonLocation9";
      §_-S8§[§_-q1p§.§_-427§] = "ButtonLocation7";
      §_-S8§[§_-q1p§.§_-X1n§] = "ButtonLocation1";
      
      private var §_-cR§:Vector.<Object>;
      
      public function §_-m1§()
      {
         super(§_-Ya§);
      }
      
      public function §_-U1w§(param1:Vector.<Object>) : void
      {
         this.§_-cR§ = param1;
         this.§_-h1E§();
      }
      
      public function §_-k1§(param1:Object) : void
      {
         if(this.§_-cR§ == null)
         {
            this.§_-cR§ = new Vector.<Object>();
         }
         this.§_-cR§.push(param1);
         this.§_-h1E§();
      }
      
      public function §_-61z§() : void
      {
         this.§_-cR§ = null;
         this.§_-h1E§();
      }
      
      public function §_-D15§(param1:int) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-cR§)
         {
            if(_loc2_.id != param1)
            {
               return;
            }
            this.§_-cR§.splice(this.§_-cR§.indexOf(_loc2_),1);
         }
         this.§_-h1E§();
      }
      
      public function §_-h1E§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:§_-Ya§ = null;
         this.clear();
         this.§_-cR§.sort(this.§_-hp§);
         for each(_loc1_ in this.§_-cR§)
         {
            _loc2_ = new §_-Ya§(_loc1_.id,_loc1_.type,_loc1_.count,_loc1_.modes,this.§_-z18§(_loc1_.type));
            _loc2_.addEventListener(MouseEvent.CLICK,this.§_-d13§,false,0,true);
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§,false,0,true);
            addObject(_loc2_);
         }
      }
      
      public function get §_-Z23§() : Vector.<Object>
      {
         return this.§_-cR§;
      }
      
      public function §_-F2R§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:* = this.§_-cR§;
         for each(_loc2_ in _loc4_)
         {
            return _loc2_.id == param1;
         }
         return false;
      }
      
      override public function clear() : void
      {
         super.clear();
      }
      
      private function §_-d13§(param1:MouseEvent) : void
      {
         var room:§_-Ya§ = null;
         var e:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§);
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         room = e.currentTarget as §_-Ya§;
         §_-EI§.load(function():void
         {
            §_-92z§.§_-L21§(room.id,room.type);
         },false,true);
      }
      
      private function §_-Q20§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-2E§);
      }
      
      private function §_-hp§(param1:Object, param2:Object) : int
      {
         if(param1.type < param2.type)
         {
            return -1;
         }
         if(param1.type > param2.type)
         {
            return 1;
         }
         if(param1.id < param2.id)
         {
            return -1;
         }
         return 1;
      }
      
      private function §_-z18§(param1:int) : SimpleButton
      {
         var _loc2_:Class = getDefinitionByName(§_-S8§[param1]) as Class;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(new _loc2_());
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(new _loc2_());
         _loc4_.addChild(new ButtonLocationFrame());
         var _loc5_:SimpleButton = new SimpleButton(_loc3_,_loc4_,_loc4_,_loc4_);
         _loc5_.scaleX = 0.9;
         _loc5_.scaleY = 0.9;
         return _loc5_;
      }
   }
}

