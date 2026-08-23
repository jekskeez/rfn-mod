package §_-Rj§
{
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-s1i§;
   import §_-e1G§.§_-Hb§;
   import events.§_-63A§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-63Q§;
   import starling.core.Starling;
   
   public class §_-U2h§ extends §_-Hb§
   {
      
      private var object:Object;
      
      private var map:§_-K15§;
      
      private var §_-I1h§:Point = new Point();
      
      private var §_-2s§:Point = new Point();
      
      private var §_-sg§:Number = NaN;
      
      private var §_-P17§:Number = NaN;
      
      private var §_-IE§:Boolean = false;
      
      private var §_-J1j§:Boolean = false;
      
      public function §_-U2h§(param1:§_-K15§)
      {
         this.map = param1;
         super(param1.§_-kz§);
         this.alpha = 0;
         §_-s1i§.instance.addEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-91U§);
         param1.addEventListener(§_-63A§.REMOVE,this.§_-Ag§);
      }
      
      override public function add() : void
      {
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         if(!this.object)
         {
            return;
         }
         if(param1)
         {
            (this.object as §_-h2I§).filters = §_-uq§.§_-dR§;
         }
         else
         {
            this.§_-E1G§(this.object);
         }
      }
      
      override public function remove() : void
      {
         §_-s1i§.instance.removeEventListener(TouchEvent.§_-N1l§,this.§_-K1G§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-91U§);
         this.map.removeEventListener(§_-63A§.REMOVE,this.§_-Ag§);
         this.§_-V1v§();
         super.remove();
      }
      
      override protected function close(param1:MouseEvent = null) : void
      {
         if(this.object)
         {
            this.§_-E1G§(this.object);
         }
         this.object = null;
         super.close(param1);
      }
      
      private function §_-E1G§(param1:Object) : void
      {
         var _loc2_:§_-h2I§ = param1 as §_-h2I§;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.filters = this.map.§_-K1n§.§_-K1n§.indexOf(param1 as §_-63Q§) != -1 ? §_-uq§.§_-dR§ : null;
      }
      
      private function §_-K1G§(param1:TouchEvent) : void
      {
         if(this.alpha == 0 && this.object == null)
         {
            return;
         }
         var _loc2_:§_-e2m§ = param1.§_-H2o§(Starling.§_-y1l§.stage);
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.§_-n2h§ == this.§_-sg§ && _loc2_.§_-Zv§ == this.§_-P17§)
         {
            return;
         }
         this.§_-sg§ = _loc2_.§_-n2h§;
         this.§_-P17§ = _loc2_.§_-Zv§;
         this.§_-2s§.x = _loc2_.§_-n2h§;
         this.§_-2s§.y = _loc2_.§_-Zv§;
         this.§_-I1h§ = _loc2_.§_-l29§(§_-s1i§.instance);
         this.§_-IE§ = true;
         this.§_-Ef§();
      }
      
      private function §_-Ef§() : void
      {
         if(this.§_-J1j§)
         {
            return;
         }
         this.§_-J1j§ = true;
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-L1Y§,false,0,true);
      }
      
      private function §_-V1v§() : void
      {
         if(!this.§_-J1j§)
         {
            return;
         }
         this.§_-J1j§ = false;
         Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-L1Y§);
      }
      
      private function §_-L1Y§(param1:Event) : void
      {
         if(!this.§_-IE§)
         {
            this.§_-V1v§();
            return;
         }
         this.§_-IE§ = false;
         if(this.alpha == 0 && this.object == null)
         {
            this.§_-V1v§();
            return;
         }
         this.§_-F2C§();
      }
      
      private function §_-F2C§() : void
      {
         if(!(this.map.game as §_-A32§).§_-a2S§(this.§_-2s§))
         {
            this.close();
            return;
         }
         var _loc1_:§_-h2I§ = this.map.§_-GH§(this.§_-I1h§);
         if(!(_loc1_ is §_-63Q§))
         {
            this.close();
            return;
         }
         if(this.object == _loc1_)
         {
            if(!(_loc1_ as §_-h2I§).parentStarling)
            {
               this.close();
            }
            else
            {
               this.§_-nq§();
            }
            return;
         }
         if(this.object)
         {
            this.§_-E1G§(this.object);
         }
         this.object = _loc1_;
         if(this.alpha == 1)
         {
            this.object.filters = §_-uq§.§_-dR§;
         }
         setStatus(this.object.name);
         this.§_-nq§();
      }
      
      private function §_-nq§() : void
      {
         if(Game.§_-d2t§ == null)
         {
            return;
         }
         var _loc1_:Point = Game.§_-d2t§.globalToLocal(this.§_-2s§);
         this.x = _loc1_.x + 13;
         this.y = _loc1_.y + 10;
         if(this.x + this.width > §_-a9§.§_-9o§)
         {
            this.x = _loc1_.x - this.width;
         }
         if(this.y + this.height > §_-a9§.§_-31m§)
         {
            this.y = _loc1_.y - this.height;
         }
         if(!Game.§_-d2t§.contains(this))
         {
            Game.§_-d2t§.addChild(this);
         }
         this.visible = true;
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.CONTROL && param1.keyCode != Keyboard.SHIFT)
         {
            return;
         }
         var _loc2_:Number = param1.shiftKey ? 0 : 1;
         if(this.alpha == _loc2_)
         {
            return;
         }
         this.alpha = _loc2_;
         if(_loc2_ == 1)
         {
            this.§_-IE§ = true;
            this.§_-Ef§();
         }
      }
      
      private function §_-91U§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.CONTROL || this.alpha == 0)
         {
            return;
         }
         this.alpha = 0;
      }
      
      private function §_-Ag§(param1:§_-63A§) : void
      {
         if(this.object == param1.className)
         {
            this.close();
         }
      }
   }
}

