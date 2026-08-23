package views
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-cx§;
   
   public class §_-O1p§ extends Sprite
   {
      
      private var §_-s1w§:DisplayObject = null;
      
      private var slots:Array;
      
      private var §_-13K§:Object;
      
      private var §_-aa§:Object;
      
      private var buttons:Object;
      
      private var §_-S1n§:Object;
      
      private var §_-K1T§:§_-K2G§ = null;
      
      private var callback:Function = null;
      
      private var §_-a§:Array;
      
      public function §_-O1p§(param1:Function)
      {
         var _loc3_:Sprite = null;
         this.slots = [];
         this.§_-13K§ = {};
         this.§_-aa§ = {};
         this.buttons = {};
         this.§_-S1n§ = {};
         this.§_-a§ = [];
         super();
         this.callback = param1;
         this.back.x = 15;
         this.back.y = 15;
         addChild(this.back);
         this.slots.push(this.back.imageSlot0,this.back.imageSlot1,this.back.imageSlot2,this.back.imageSlot3,this.back.imageSlot4,this.back.imageSlot5);
         var _loc2_:int = 0;
         while(_loc2_ < this.slots.length)
         {
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(0,0);
            _loc3_.graphics.drawRect(0,0,70,60);
            _loc3_.x = 9 + _loc2_ % 2 * 96;
            _loc3_.y = 5 + int(_loc2_ * 0.5) * 84;
            _loc3_.name = _loc2_.toString();
            _loc3_.buttonMode = true;
            _loc3_.addEventListener(MouseEvent.CLICK,this.select);
            addChild(_loc3_);
            this.buttons[_loc2_] = _loc3_;
            _loc2_++;
         }
         this.§_-K1T§ = new §_-K2G§(gls("Снять всё"));
         this.§_-K1T§.scaleX = this.§_-K1T§.scaleY = 0.8;
         this.§_-K1T§.x = this.back.x + (this.back.width - this.§_-K1T§.width) * 0.5 + 5;
         this.§_-K1T§.y = this.back.y + this.back.height + 20;
         this.§_-K1T§.§_-I29§();
         this.§_-K1T§.addEventListener(MouseEvent.CLICK,this.§_-Dy§);
         addChild(this.§_-K1T§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.update);
         this.update();
      }
      
      private function get back() : WardrobeClothesSlots
      {
         if(!this.§_-s1w§)
         {
            this.§_-s1w§ = new WardrobeClothesSlots();
         }
         return this.§_-s1w§ as WardrobeClothesSlots;
      }
      
      private function select(param1:MouseEvent) : void
      {
         this.callback(int(param1.currentTarget.name));
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Array = §_-cx§.§_-i1c§(§_-L1o§.§_-ig§,this.§_-a§);
         var _loc3_:Array = §_-cx§.§_-i1c§(this.§_-a§,§_-L1o§.§_-ig§);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = §_-P2x§.§_-01x§(_loc3_[_loc4_]);
            this.slots[_loc5_].visible = true;
            if(_loc5_ in this.§_-13K§)
            {
               this.§_-13K§[_loc5_].visible = false;
               this.§_-aa§[_loc5_].visible = false;
               (this.§_-S1n§[_loc5_] as §_-kr§).remove();
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = §_-P2x§.§_-01x§(_loc2_[_loc4_]);
            this.slots[_loc5_].visible = false;
            if(_loc5_ in this.§_-13K§)
            {
               removeChild(this.§_-13K§[_loc5_]);
            }
            this.§_-13K§[_loc5_] = new §_-332§(_loc2_[_loc4_]);
            this.§_-13K§[_loc5_].x = 9 + _loc5_ % 2 * 94;
            this.§_-13K§[_loc5_].y = 5 + int(_loc5_ * 0.5) * 84;
            addChildAt(this.§_-13K§[_loc5_],0);
            if(!(_loc5_ in this.§_-aa§))
            {
               this.§_-aa§[_loc5_] = new ButtonRedCross();
               this.§_-aa§[_loc5_].x = 77 + _loc5_ % 2 * 94;
               this.§_-aa§[_loc5_].y = 10 + int(_loc5_ * 0.5) * 84;
               this.§_-aa§[_loc5_].addEventListener(MouseEvent.CLICK,this.§_-m1O§);
               addChild(this.§_-aa§[_loc5_]);
            }
            this.§_-aa§[_loc5_].name = _loc2_[_loc4_].toString();
            this.§_-aa§[_loc5_].visible = true;
            if(!(_loc5_ in this.§_-S1n§))
            {
               this.§_-S1n§[_loc5_] = new §_-kr§(this.buttons[_loc5_],§_-P2x§.§_-d1E§(_loc2_[_loc4_]),true);
            }
            else
            {
               (this.§_-S1n§[_loc5_] as §_-kr§).setStatus(§_-P2x§.§_-d1E§(_loc2_[_loc4_]));
               (this.§_-S1n§[_loc5_] as §_-kr§).add();
            }
            _loc4_++;
         }
         this.§_-a§ = §_-L1o§.§_-ig§.concat();
         this.§_-K1T§.visible = §_-L1o§.§_-ig§.length > 1;
      }
      
      private function §_-m1O§(param1:MouseEvent) : void
      {
         §_-L1o§.§_-R2f§(§_-L1o§.§_-d1W§,int(param1.currentTarget.name));
      }
      
      private function §_-Dy§(param1:MouseEvent) : void
      {
         var _loc2_:Array = §_-L1o§.§_-ig§.concat();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-L1o§.§_-R2f§(§_-L1o§.§_-d1W§,_loc2_[_loc3_]);
            _loc3_++;
         }
      }
   }
}

