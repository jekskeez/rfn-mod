package §_-D0§
{
   import §_-B1G§.ScrollPane;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-f4§;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import sounds.GameSounds;
   
   public class §_-b1e§ extends Sprite
   {
      
      private static const §_-13u§:int = 390;
      
      private static const §_-P2p§:int = 310;
      
      private static const §_-F1z§:int = 197;
      
      private static const §_-O1U§:int = 15;
      
      private static const §_-21X§:int = §_-33U§.§_-i2u§;
      
      private var §_-s1q§:int = 0;
      
      private var content:Sprite;
      
      private var track:Shape;
      
      private var §_-W18§:ScrollPane;
      
      private var §_-z3§:Vector.<§_-33U§> = new Vector.<§_-33U§>(0);
      
      private var §_-o1I§:Sprite;
      
      private var §_-K2q§:§_-d1q§;
      
      private var §_-NO§:§_-K2G§;
      
      private var §_-IJ§:int = 0;
      
      public function §_-b1e§()
      {
         super();
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.setSize(§_-13u§ + 7,§_-P2p§);
         this.§_-W18§.verticalLineScrollSize = §_-21X§;
         addChild(this.§_-W18§);
         this.content = new Sprite();
         this.track = new Shape();
         this.content.addChild(this.track);
         this.§_-W18§.source = this.content;
         this.§_-NO§ = new §_-K2G§(gls("Забрать все"),120,13,this.§_-K1z§);
         this.§_-NO§.scaleX = this.§_-NO§.scaleY = 0.9;
         this.§_-NO§.x = (§_-13u§ + 7 - this.§_-NO§.width) * 0.5;
         this.§_-NO§.y = §_-P2p§ - this.§_-NO§.height - 5;
         this.§_-NO§.visible = false;
         addChild(this.§_-NO§);
      }
      
      public function set passType(param1:int) : void
      {
         this.§_-s1q§ = param1;
         this.§_-x1E§();
      }
      
      public function get passType() : int
      {
         return this.§_-s1q§;
      }
      
      public function §_-iJ§() : void
      {
         var _loc5_:§_-33U§ = null;
         var _loc1_:int = NuttyPassManager.§_-d1l§(this.§_-s1q§);
         if(_loc1_ != this.§_-IJ§)
         {
            this.§_-x1E§();
            return;
         }
         if(this.§_-IJ§ == 0)
         {
            return;
         }
         var _loc2_:int = NuttyPassManager.§_-82P§(this.§_-s1q§);
         var _loc3_:int = NuttyPassManager.§_-NZ§(this.§_-s1q§);
         var _loc4_:Boolean = NuttyPassManager.§_-M2X§(this.§_-s1q§);
         for each(_loc5_ in this.§_-z3§)
         {
            _loc5_.update(_loc2_,_loc4_);
         }
         if(this.§_-o1I§)
         {
            this.§_-o1I§.visible = _loc2_ > 0 && _loc2_ < this.§_-z3§.length;
            if(this.§_-o1I§.visible)
            {
               this.§_-o1I§.y = _loc2_ * §_-21X§ - 2;
            }
         }
         var _loc6_:Object = NuttyPassManager.§_-t2K§(this.§_-s1q§);
         if(Boolean(this.§_-K2q§) && Boolean(_loc6_))
         {
            this.§_-K2q§.setData(this.§_-s1q§,_loc6_.points,this.§_-z3§.length,_loc6_.reward,_loc2_,_loc3_);
         }
         this.§_-NO§.visible = NuttyPassManager.§_-94§(this.§_-s1q§);
      }
      
      private function §_-x1E§() : void
      {
         var _loc8_:§_-33U§ = null;
         while(this.content.numChildren > 0)
         {
            this.content.removeChildAt(0);
         }
         this.content.addChild(this.track);
         this.§_-z3§.length = 0;
         this.§_-IJ§ = NuttyPassManager.§_-d1l§(this.§_-s1q§);
         var _loc1_:uint = uint(§_-C2b§.§_-Sz§(this.§_-s1q§));
         var _loc2_:Array = NuttyPassManager.§_-V2L§(this.§_-s1q§);
         this.§_-o1I§ = this.§_-e2C§();
         this.§_-o1I§.visible = false;
         this.content.addChild(this.§_-o1I§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc8_ = new §_-33U§();
            _loc8_.y = _loc3_ * §_-21X§;
            _loc8_.build(_loc2_[_loc3_].level + 1,_loc2_[_loc3_].free,_loc2_[_loc3_].paid,_loc1_,this.§_-s1q§);
            this.content.addChild(_loc8_);
            this.§_-z3§.push(_loc8_);
            _loc3_++;
         }
         var _loc4_:int = _loc2_.length * §_-21X§;
         var _loc5_:Object = NuttyPassManager.§_-t2K§(this.§_-s1q§);
         var _loc6_:int = NuttyPassManager.§_-82P§(this.§_-s1q§);
         var _loc7_:int = NuttyPassManager.§_-NZ§(this.§_-s1q§);
         if(_loc5_)
         {
            if(!this.§_-K2q§)
            {
               this.§_-K2q§ = new §_-d1q§();
            }
            this.§_-K2q§.y = _loc4_ + §_-O1U§;
            this.§_-K2q§.setData(this.§_-s1q§,_loc5_.points,_loc2_.length,_loc5_.reward,_loc6_,_loc7_);
            this.content.addChild(this.§_-K2q§);
            _loc4_ += §_-d1q§.§_-i2u§;
         }
         this.§_-c1m§(_loc4_);
         this.§_-W18§.update();
         this.§_-iJ§();
      }
      
      private function §_-e2C§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.beginFill(15522236,0.85);
         _loc2_.graphics.drawRect(0,0,§_-13u§,3);
         _loc2_.graphics.endFill();
         _loc1_.addChild(_loc2_);
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(§_-C2b§.§_-Sz§(this.§_-s1q§));
         _loc3_.graphics.drawCircle(§_-F1z§,1,16);
         _loc3_.graphics.endFill();
         _loc1_.addChild(_loc3_);
         var _loc4_:DisplayObject = new ImageIconNuttyPassLock();
         _loc4_.scaleX = _loc4_.scaleY = 20 / Math.max(_loc4_.width,_loc4_.height);
         _loc4_.x = §_-F1z§ - _loc4_.width * 0.5;
         _loc4_.y = 1 - _loc4_.height * 0.5;
         _loc1_.addChild(_loc4_);
         return _loc1_;
      }
      
      private function §_-c1m§(param1:int) : void
      {
         this.track.graphics.clear();
         this.track.graphics.lineStyle(3,§_-C2b§.§_-Sz§(this.§_-s1q§));
         this.track.graphics.moveTo(§_-F1z§,0);
         this.track.graphics.lineTo(§_-F1z§,Math.max(§_-P2p§,param1));
      }
      
      private function §_-K1z§(param1:Event = null) : void
      {
         var _loc2_:Object = null;
         GameSounds.play("dialog_shaman");
         for each(_loc2_ in NuttyPassManager.§_-aE§(this.§_-s1q§))
         {
            §_-f4§.§_-6M§(_loc2_.id,_loc2_.count);
         }
      }
   }
}

