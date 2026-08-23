package tape
{
   import §_-X1k§.§_-Wd§;
   import §_-c2C§.§_-u24§;
   import §_-s2e§.§_-U2d§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-G2V§ extends §_-h2f§
   {
      
      private static var §_-B1O§:Object = {};
      
      §_-B1O§[§_-at§.§_-I6§] = "ButtonLocation1";
      §_-B1O§[§_-at§.§_-D18§] = "ButtonLocation3";
      §_-B1O§[§_-at§.§_-92b§] = "ButtonLocation4";
      §_-B1O§[§_-at§.§_-j1i§] = "ButtonLocation5";
      §_-B1O§[§_-at§.§_-e2a§] = "ButtonLocation8";
      §_-B1O§[§_-at§.§_-N2g§] = "ButtonLocation7";
      §_-B1O§[§_-at§.§_-U1s§] = "ButtonLocation6";
      §_-B1O§[§_-at§.§_-vr§] = "ButtonLocation1";
      §_-B1O§[§_-at§.§_-G1K§] = "ButtonLocation9";
      §_-B1O§[§_-at§.§_-nq§] = "ButtonLocation7";
      §_-B1O§[§_-at§.§_-B2t§] = "ButtonLocation1";
      
      private var §_-v1y§:Vector.<Object>;
      
      public function §_-G2V§()
      {
         super(§_-m14§);
      }
      
      public function §_-j1a§(param1:Vector.<Object>) : void
      {
         this.§_-v1y§ = param1;
         this.§_-1S§();
      }
      
      public function §_-p2O§(param1:Object) : void
      {
         if(this.§_-v1y§ == null)
         {
            this.§_-v1y§ = new Vector.<Object>();
         }
         this.§_-v1y§.push(param1);
         this.§_-1S§();
      }
      
      public function §_-C30§() : void
      {
         this.§_-v1y§ = null;
         this.§_-1S§();
      }
      
      public function §_-A33§(param1:int) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this.§_-v1y§)
         {
            if(_loc2_.id != param1)
            {
               return;
            }
            this.§_-v1y§.splice(this.§_-v1y§.indexOf(_loc2_),1);
         }
         this.§_-1S§();
      }
      
      public function §_-1S§() : void
      {
         var _loc1_:Object = null;
         var _loc2_:§_-m14§ = null;
         this.clear();
         this.§_-v1y§.sort(this.§_-U17§);
         for each(_loc1_ in this.§_-v1y§)
         {
            _loc2_ = new §_-m14§(_loc1_.id,_loc1_.type,_loc1_.count,_loc1_.modes,this.§_-u1D§(_loc1_.type));
            _loc2_.addEventListener(MouseEvent.CLICK,this.§_-11y§,false,0,true);
            _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§,false,0,true);
            addObject(_loc2_);
         }
      }
      
      public function get §_-s2k§() : Vector.<Object>
      {
         return this.§_-v1y§;
      }
      
      public function §_-435§(param1:int) : Boolean
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:* = this.§_-v1y§;
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
      
      private function §_-11y§(param1:MouseEvent) : void
      {
         var room:§_-m14§ = null;
         var e:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§);
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         room = e.currentTarget as §_-m14§;
         §_-U2d§.load(function():void
         {
            §_-u24§.§_-F2z§(room.id,room.type);
         },false,true);
      }
      
      private function §_-T2H§(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-Q1z§);
      }
      
      private function §_-U17§(param1:Object, param2:Object) : int
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
      
      private function §_-u1D§(param1:int) : SimpleButton
      {
         var _loc2_:Class = getDefinitionByName(§_-B1O§[param1]) as Class;
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

