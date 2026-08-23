package §_-l2u§
{
   import §_-S1n§.§_-kr§;
   import §_-TK§.§_-aS§;
   import §_-c2C§.§_-817§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-J1a§;
   import events.§_-F2k§;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import game.mainGame.entity.§_-xn§;
   import starling.core.Starling;
   
   public class §_-T1Y§ extends §_-kr§
   {
      
      private var object:Object;
      
      private var map:§_-53A§;
      
      private var §_-7k§:Point = new Point();
      
      private var §_-038§:Point = new Point();
      
      private var §_-d1f§:Number = NaN;
      
      private var §_-uJ§:Number = NaN;
      
      private var §_-61I§:Boolean = false;
      
      private var §_-Hv§:Boolean = false;
      
      public function §_-T1Y§(param1:§_-53A§)
      {
         this.map = param1;
         super(param1.§_-1l§);
         this.alpha = 0;
         §_-817§.instance.addEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.addEventListener(KeyboardEvent.KEY_UP,this.§_-P1D§);
         param1.addEventListener(§_-F2k§.REMOVE,this.§_-GC§);
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
            (this.object as §_-aS§).filters = §_-t2k§.§_-22t§;
         }
         else
         {
            this.§_-ga§(this.object);
         }
      }
      
      override public function remove() : void
      {
         §_-817§.instance.removeEventListener(TouchEvent.§_-qu§,this.§_-w1m§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-73S§);
         Game.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§_-P1D§);
         this.map.removeEventListener(§_-F2k§.REMOVE,this.§_-GC§);
         this.§_-P1b§();
         super.remove();
      }
      
      override protected function close(param1:MouseEvent = null) : void
      {
         if(this.object)
         {
            this.§_-ga§(this.object);
         }
         this.object = null;
         super.close(param1);
      }
      
      private function §_-ga§(param1:Object) : void
      {
         var _loc2_:§_-aS§ = param1 as §_-aS§;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.filters = this.map.§_-B3S§.§_-B3S§.indexOf(param1 as §_-xn§) != -1 ? §_-t2k§.§_-22t§ : null;
      }
      
      private function §_-w1m§(param1:TouchEvent) : void
      {
         if(this.alpha == 0 && this.object == null)
         {
            return;
         }
         var _loc2_:§_-J1a§ = param1.§_-d2S§(Starling.§_-n1s§.stage);
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.§_-ca§ == this.§_-d1f§ && _loc2_.§_-n2z§ == this.§_-uJ§)
         {
            return;
         }
         this.§_-d1f§ = _loc2_.§_-ca§;
         this.§_-uJ§ = _loc2_.§_-n2z§;
         this.§_-038§.x = _loc2_.§_-ca§;
         this.§_-038§.y = _loc2_.§_-n2z§;
         this.§_-7k§ = _loc2_.§_-13l§(§_-817§.instance);
         this.§_-61I§ = true;
         this.§_-D2m§();
      }
      
      private function §_-D2m§() : void
      {
         if(this.§_-Hv§)
         {
            return;
         }
         this.§_-Hv§ = true;
         Game.stage.addEventListener(Event.ENTER_FRAME,this.§_-A1X§,false,0,true);
      }
      
      private function §_-P1b§() : void
      {
         if(!this.§_-Hv§)
         {
            return;
         }
         this.§_-Hv§ = false;
         Game.stage.removeEventListener(Event.ENTER_FRAME,this.§_-A1X§);
      }
      
      private function §_-A1X§(param1:Event) : void
      {
         if(!this.§_-61I§)
         {
            this.§_-P1b§();
            return;
         }
         this.§_-61I§ = false;
         if(this.alpha == 0 && this.object == null)
         {
            this.§_-P1b§();
            return;
         }
         this.§_-e17§();
      }
      
      private function §_-e17§() : void
      {
         if(!(this.map.game as §_-62b§).§_-l2y§(this.§_-038§))
         {
            this.close();
            return;
         }
         var _loc1_:§_-aS§ = this.map.§_-t1J§(this.§_-7k§);
         if(!(_loc1_ is §_-xn§))
         {
            this.close();
            return;
         }
         if(this.object == _loc1_)
         {
            if(!(_loc1_ as §_-aS§).parentStarling)
            {
               this.close();
            }
            else
            {
               this.§_-e1F§();
            }
            return;
         }
         if(this.object)
         {
            this.§_-ga§(this.object);
         }
         this.object = _loc1_;
         if(this.alpha == 1)
         {
            this.object.filters = §_-t2k§.§_-22t§;
         }
         setStatus(this.object.name);
         this.§_-e1F§();
      }
      
      private function §_-e1F§() : void
      {
         if(Game.§_-q1L§ == null)
         {
            return;
         }
         var _loc1_:Point = Game.§_-q1L§.globalToLocal(this.§_-038§);
         this.x = _loc1_.x + 13;
         this.y = _loc1_.y + 10;
         if(this.x + this.width > §_-Zy§.§_-21V§)
         {
            this.x = _loc1_.x - this.width;
         }
         if(this.y + this.height > §_-Zy§.§_-02T§)
         {
            this.y = _loc1_.y - this.height;
         }
         if(!Game.§_-q1L§.contains(this))
         {
            Game.§_-q1L§.addChild(this);
         }
         this.visible = true;
      }
      
      private function §_-73S§(param1:KeyboardEvent) : void
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
            this.§_-61I§ = true;
            this.§_-D2m§();
         }
      }
      
      private function §_-P1D§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.CONTROL || this.alpha == 0)
         {
            return;
         }
         this.alpha = 0;
      }
      
      private function §_-GC§(param1:§_-F2k§) : void
      {
         if(this.object == param1.className)
         {
            this.close();
         }
      }
   }
}

