package views
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-qF§;
   
   public class §_-m10§ extends Sprite
   {
      
      private var §_-FH§:DisplayObject = null;
      
      private var slots:Array;
      
      private var §_-U2y§:Object;
      
      private var §_-iz§:Object;
      
      private var buttons:Object;
      
      private var §_-e1G§:Object;
      
      private var §_-63y§:§_-j18§ = null;
      
      private var callback:Function = null;
      
      private var §_-jy§:Array;
      
      public function §_-m10§(param1:Function)
      {
         var _loc3_:Sprite = null;
         this.slots = [];
         this.§_-U2y§ = {};
         this.§_-iz§ = {};
         this.buttons = {};
         this.§_-e1G§ = {};
         this.§_-jy§ = [];
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
         this.§_-63y§ = new §_-j18§(gls("Снять всё"));
         this.§_-63y§.scaleX = this.§_-63y§.scaleY = 0.8;
         this.§_-63y§.x = this.back.x + (this.back.width - this.§_-63y§.width) * 0.5 + 5;
         this.§_-63y§.y = this.back.y + this.back.height + 20;
         this.§_-63y§.§_-52e§();
         this.§_-63y§.addEventListener(MouseEvent.CLICK,this.§_-62H§);
         addChild(this.§_-63y§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.update);
         this.update();
      }
      
      private function get back() : WardrobeClothesSlots
      {
         if(!this.§_-FH§)
         {
            this.§_-FH§ = new WardrobeClothesSlots();
         }
         return this.§_-FH§ as WardrobeClothesSlots;
      }
      
      private function select(param1:MouseEvent) : void
      {
         this.callback(int(param1.currentTarget.name));
      }
      
      private function update(param1:GameEvent = null) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Array = §_-qF§.§_-D1h§(§_-h1f§.§_-51k§,this.§_-jy§);
         var _loc3_:Array = §_-qF§.§_-D1h§(this.§_-jy§,§_-h1f§.§_-51k§);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = §_-g2W§.§_-m1y§(_loc3_[_loc4_]);
            this.slots[_loc5_].visible = true;
            if(_loc5_ in this.§_-U2y§)
            {
               this.§_-U2y§[_loc5_].visible = false;
               this.§_-iz§[_loc5_].visible = false;
               (this.§_-e1G§[_loc5_] as §_-Hb§).remove();
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = §_-g2W§.§_-m1y§(_loc2_[_loc4_]);
            this.slots[_loc5_].visible = false;
            if(_loc5_ in this.§_-U2y§)
            {
               removeChild(this.§_-U2y§[_loc5_]);
            }
            this.§_-U2y§[_loc5_] = new §_-fa§(_loc2_[_loc4_]);
            this.§_-U2y§[_loc5_].x = 9 + _loc5_ % 2 * 94;
            this.§_-U2y§[_loc5_].y = 5 + int(_loc5_ * 0.5) * 84;
            addChildAt(this.§_-U2y§[_loc5_],0);
            if(!(_loc5_ in this.§_-iz§))
            {
               this.§_-iz§[_loc5_] = new ButtonRedCross();
               this.§_-iz§[_loc5_].x = 77 + _loc5_ % 2 * 94;
               this.§_-iz§[_loc5_].y = 10 + int(_loc5_ * 0.5) * 84;
               this.§_-iz§[_loc5_].addEventListener(MouseEvent.CLICK,this.§_-b2v§);
               addChild(this.§_-iz§[_loc5_]);
            }
            this.§_-iz§[_loc5_].name = _loc2_[_loc4_].toString();
            this.§_-iz§[_loc5_].visible = true;
            if(!(_loc5_ in this.§_-e1G§))
            {
               this.§_-e1G§[_loc5_] = new §_-Hb§(this.buttons[_loc5_],§_-g2W§.§_-224§(_loc2_[_loc4_]),true);
            }
            else
            {
               (this.§_-e1G§[_loc5_] as §_-Hb§).setStatus(§_-g2W§.§_-224§(_loc2_[_loc4_]));
               (this.§_-e1G§[_loc5_] as §_-Hb§).add();
            }
            _loc4_++;
         }
         this.§_-jy§ = §_-h1f§.§_-51k§.concat();
         this.§_-63y§.visible = §_-h1f§.§_-51k§.length > 1;
      }
      
      private function §_-b2v§(param1:MouseEvent) : void
      {
         §_-h1f§.§_-s1C§(§_-h1f§.§_-03X§,int(param1.currentTarget.name));
      }
      
      private function §_-62H§(param1:MouseEvent) : void
      {
         var _loc2_:Array = §_-h1f§.§_-51k§.concat();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            §_-h1f§.§_-s1C§(§_-h1f§.§_-03X§,_loc2_[_loc3_]);
            _loc3_++;
         }
      }
   }
}

