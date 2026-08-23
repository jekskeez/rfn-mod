package §_-B25§
{
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-A29§;
   import §_-I10§.§_-a1D§;
   import §_-Kr§.ScrollPane;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-RW§ extends Sprite
   {
      
      private static const §_-N1a§:int = 390;
      
      private static const §_-01e§:int = 310;
      
      private static const §_-n2j§:int = 197;
      
      private static const §_-8l§:int = 15;
      
      private static const §_-I1Y§:int = §_-Y2X§.§_-kI§;
      
      private var §_-mb§:int = 0;
      
      private var content:Sprite;
      
      private var track:Shape;
      
      private var §_-M1N§:ScrollPane;
      
      private var §_-bx§:Vector.<§_-Y2X§> = new Vector.<§_-Y2X§>(0);
      
      private var §_-ca§:Sprite;
      
      private var §_-e0§:§_-JY§;
      
      private var §_-71q§:§_-j18§;
      
      private var §_-f0§:int = 0;
      
      public function §_-RW§()
      {
         super();
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.setSize(§_-N1a§ + 7,§_-01e§);
         this.§_-M1N§.verticalLineScrollSize = §_-I1Y§;
         addChild(this.§_-M1N§);
         this.content = new Sprite();
         this.track = new Shape();
         this.content.addChild(this.track);
         this.§_-M1N§.source = this.content;
         this.§_-71q§ = new §_-j18§(gls("Забрать все"),120,13,this.§_-i27§);
         this.§_-71q§.scaleX = this.§_-71q§.scaleY = 0.9;
         this.§_-71q§.x = (§_-N1a§ + 7 - this.§_-71q§.width) * 0.5;
         this.§_-71q§.y = §_-01e§ - this.§_-71q§.height - 5;
         this.§_-71q§.visible = false;
         addChild(this.§_-71q§);
      }
      
      public function set passType(param1:int) : void
      {
         this.§_-mb§ = param1;
         this.§_-15§();
      }
      
      public function get passType() : int
      {
         return this.§_-mb§;
      }
      
      public function §_-f19§() : void
      {
         var _loc5_:§_-Y2X§ = null;
         var _loc1_:int = NuttyPassManager.§_-R2B§(this.§_-mb§);
         if(_loc1_ != this.§_-f0§)
         {
            this.§_-15§();
            return;
         }
         if(this.§_-f0§ == 0)
         {
            return;
         }
         var _loc2_:int = NuttyPassManager.§_-A1x§(this.§_-mb§);
         var _loc3_:int = NuttyPassManager.§_-NY§(this.§_-mb§);
         var _loc4_:Boolean = NuttyPassManager.§_-pU§(this.§_-mb§);
         for each(_loc5_ in this.§_-bx§)
         {
            _loc5_.update(_loc2_,_loc4_);
         }
         if(this.§_-ca§)
         {
            this.§_-ca§.visible = _loc2_ > 0 && _loc2_ < this.§_-bx§.length;
            if(this.§_-ca§.visible)
            {
               this.§_-ca§.y = _loc2_ * §_-I1Y§ - 2;
            }
         }
         var _loc6_:Object = NuttyPassManager.§_-GE§(this.§_-mb§);
         if(Boolean(this.§_-e0§) && Boolean(_loc6_))
         {
            this.§_-e0§.setData(this.§_-mb§,_loc6_.points,this.§_-bx§.length,_loc6_.reward,_loc2_,_loc3_);
         }
         this.§_-71q§.visible = NuttyPassManager.§_-11M§(this.§_-mb§);
      }
      
      private function §_-15§() : void
      {
         var _loc8_:§_-Y2X§ = null;
         while(this.content.numChildren > 0)
         {
            this.content.removeChildAt(0);
         }
         this.content.addChild(this.track);
         this.§_-bx§.length = 0;
         this.§_-f0§ = NuttyPassManager.§_-R2B§(this.§_-mb§);
         var _loc1_:uint = uint(§_-a1D§.§_-DG§(this.§_-mb§));
         var _loc2_:Array = NuttyPassManager.§_-F1r§(this.§_-mb§);
         this.§_-ca§ = this.§_-s1s§();
         this.§_-ca§.visible = false;
         this.content.addChild(this.§_-ca§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc8_ = new §_-Y2X§();
            _loc8_.y = _loc3_ * §_-I1Y§;
            _loc8_.build(_loc2_[_loc3_].level + 1,_loc2_[_loc3_].free,_loc2_[_loc3_].paid,_loc1_,this.§_-mb§);
            this.content.addChild(_loc8_);
            this.§_-bx§.push(_loc8_);
            _loc3_++;
         }
         var _loc4_:int = _loc2_.length * §_-I1Y§;
         var _loc5_:Object = NuttyPassManager.§_-GE§(this.§_-mb§);
         var _loc6_:int = NuttyPassManager.§_-A1x§(this.§_-mb§);
         var _loc7_:int = NuttyPassManager.§_-NY§(this.§_-mb§);
         if(_loc5_)
         {
            if(!this.§_-e0§)
            {
               this.§_-e0§ = new §_-JY§();
            }
            this.§_-e0§.y = _loc4_ + §_-8l§;
            this.§_-e0§.setData(this.§_-mb§,_loc5_.points,_loc2_.length,_loc5_.reward,_loc6_,_loc7_);
            this.content.addChild(this.§_-e0§);
            _loc4_ += §_-JY§.§_-kI§;
         }
         this.§_-X1L§(_loc4_);
         this.§_-M1N§.update();
         this.§_-f19§();
      }
      
      private function §_-s1s§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(15522236,0.85);
         _loc2_.graphics.drawRect(0,0,§_-N1a§,3);
         _loc2_.graphics.endFill();
         _loc1_.addChild(_loc2_);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(§_-a1D§.§_-DG§(this.§_-mb§));
         _loc3_.graphics.drawCircle(§_-n2j§,1,16);
         _loc3_.graphics.endFill();
         _loc1_.addChild(_loc3_);
         var _loc4_:DisplayObject = new ImageIconNuttyPassLock();
         _loc4_.scaleX = _loc4_.scaleY = 20 / Math.max(_loc4_.width,_loc4_.height);
         _loc4_.x = §_-n2j§ - _loc4_.width * 0.5;
         _loc4_.y = 1 - _loc4_.height * 0.5;
         _loc1_.addChild(_loc4_);
         return _loc1_;
      }
      
      private function §_-X1L§(param1:int) : void
      {
         this.track.graphics.clear();
         this.track.graphics.lineStyle(3,§_-a1D§.§_-DG§(this.§_-mb§));
         this.track.graphics.moveTo(§_-n2j§,0);
         this.track.graphics.lineTo(§_-n2j§,Math.max(§_-01e§,param1));
      }
      
      private function §_-i27§(param1:Event = null) : void
      {
         var _loc2_:Object = null;
         GameSounds.play("dialog_shaman");
         for each(_loc2_ in NuttyPassManager.§_-J1Q§(this.§_-mb§))
         {
            §_-A29§.§_-A3l§(_loc2_.id,_loc2_.count);
         }
      }
   }
}

