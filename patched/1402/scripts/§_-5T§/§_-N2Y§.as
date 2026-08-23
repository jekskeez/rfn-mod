package §_-5T§
{
   import §_-X1k§.§_-WS§;
   import §_-i2A§.§_-h2I§;
   import §_-i2A§.§_-k1O§;
   import §_-s2e§.§_-U2d§;
   import §_-wJ§.§_-q2U§;
   import §_-wJ§.§_-q2Z§;
   import buttons.§_-j2x§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import tape.§_-h2f§;
   
   public class §_-N2Y§ extends Sprite
   {
      
      public static const §_-b16§:int = 9;
      
      private var data:§_-h2f§ = null;
      
      private var §_-ZG§:§_-h2I§ = null;
      
      public function §_-N2Y§()
      {
         super();
         this.init();
      }
      
      public function addItem(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-b16§)
         {
            if((this.data.objects[_loc2_] as §_-q2Z§).isEmpty)
            {
               §_-WS§.§_-l2b§.push(param1);
               (this.data.objects[_loc2_] as §_-q2Z§).elementId = param1;
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function removeItem(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-b16§)
         {
            if((this.data.objects[_loc2_] as §_-q2Z§).elementId == param1)
            {
               (this.data.objects[_loc2_] as §_-q2Z§).remove();
               break;
            }
            _loc2_++;
         }
         var _loc3_:int = _loc2_;
         while(_loc3_ < §_-b16§ - 1)
         {
            if((this.data.objects[_loc3_ + 1] as §_-q2Z§).isEmpty)
            {
               break;
            }
            (this.data.objects[_loc3_] as §_-q2Z§).elementId = (this.data.objects[_loc3_ + 1] as §_-q2Z§).elementId;
            (this.data.objects[_loc3_ + 1] as §_-q2Z§).remove();
            _loc3_++;
         }
      }
      
      public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-b16§)
         {
            if(_loc2_ == param1.length)
            {
               break;
            }
            (this.data.objects[_loc2_] as §_-q2Z§).remove();
            (this.data.objects[_loc2_] as §_-q2Z§).elementId = param1[_loc2_];
            _loc2_++;
         }
      }
      
      private function init() : void
      {
         var _loc4_:§_-q2Z§ = null;
         this.graphics.beginFill(14535087);
         this.graphics.drawRoundRect(0,0,808,55,5,5);
         addChild(new §_-i5§(gls("Коллекции\nна обмен"),25,6,new TextFormat(§_-i5§.§_-p1s§,16,16777215,true,null,null,null,null,"center")));
         var _loc1_:§_-j2x§ = new §_-j2x§(gls("Обменяться\nс друзьями"),0,14,null,1.5);
         _loc1_.x = 652;
         _loc1_.y = 6;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-92t§);
         addChild(_loc1_);
         this.data = new §_-h2f§();
         var _loc2_:int = 0;
         while(_loc2_ < §_-b16§)
         {
            _loc4_ = new §_-q2Z§();
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-T1P§);
            this.data.§_-LF§(_loc4_);
            _loc2_++;
         }
         var _loc3_:§_-q2U§ = new §_-q2U§(§_-b16§,1,0,0,7,0,45,45);
         _loc3_.x = 160;
         _loc3_.y = 5;
         _loc3_.setData(this.data);
         addChild(_loc3_);
      }
      
      private function §_-92t§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(!§_-k1O§.§_-Y25§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-12L§,0);
         }
         §_-k1O§.§_-Y25§ = true;
         §_-U2d§.load(function():void
         {
            §_-k1O§.§_-yC§(-1);
         });
      }
      
      private function §_-T1P§(param1:MouseEvent) : void
      {
         if(param1.target is ButtonCross)
         {
            return;
         }
         if(param1.currentTarget.elementId == -1)
         {
            return;
         }
         var _loc2_:Boolean = false;
         switch(Game.self.type)
         {
            case §_-Zy§.§_-Q1M§:
            case §_-Zy§.§_-zE§:
            case §_-Zy§.§_-s12§:
            case §_-Zy§.§_-32G§:
               _loc2_ = true;
         }
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-ZG§ == null)
         {
            this.§_-ZG§ = new §_-h2I§();
         }
         this.§_-ZG§.§_-p2N§ = param1.currentTarget.elementId;
         this.§_-ZG§.show();
      }
   }
}

