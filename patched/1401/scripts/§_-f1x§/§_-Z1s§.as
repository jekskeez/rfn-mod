package §_-f1x§
{
   import §_-61U§.§_-9m§;
   import §_-61U§.§_-e2K§;
   import §_-68§.§_-EI§;
   import §_-I10§.§_-k1C§;
   import §_-r16§.§_-22v§;
   import §_-r16§.§_-U3§;
   import buttons.§_-hH§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import tape.§_-xc§;
   
   public class §_-Z1s§ extends Sprite
   {
      
      public static const §_-k2d§:int = 9;
      
      private var data:§_-xc§ = null;
      
      private var §_-Vb§:§_-e2K§ = null;
      
      public function §_-Z1s§()
      {
         super();
         this.init();
      }
      
      public function addItem(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-k2d§)
         {
            if((this.data.objects[_loc2_] as §_-U3§).isEmpty)
            {
               §_-k1C§.§_-h1G§.push(param1);
               (this.data.objects[_loc2_] as §_-U3§).elementId = param1;
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function removeItem(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-k2d§)
         {
            if((this.data.objects[_loc2_] as §_-U3§).elementId == param1)
            {
               (this.data.objects[_loc2_] as §_-U3§).remove();
               break;
            }
            _loc2_++;
         }
         var _loc3_:int = _loc2_;
         while(_loc3_ < §_-k2d§ - 1)
         {
            if((this.data.objects[_loc3_ + 1] as §_-U3§).isEmpty)
            {
               break;
            }
            (this.data.objects[_loc3_] as §_-U3§).elementId = (this.data.objects[_loc3_ + 1] as §_-U3§).elementId;
            (this.data.objects[_loc3_ + 1] as §_-U3§).remove();
            _loc3_++;
         }
      }
      
      public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-k2d§)
         {
            if(_loc2_ == param1.length)
            {
               break;
            }
            (this.data.objects[_loc2_] as §_-U3§).remove();
            (this.data.objects[_loc2_] as §_-U3§).elementId = param1[_loc2_];
            _loc2_++;
         }
      }
      
      private function init() : void
      {
         var _loc4_:§_-U3§ = null;
         this.graphics.beginFill(14535087);
         this.graphics.drawRoundRect(0,0,808,55,5,5);
         addChild(new §_-22V§(gls("Коллекции\nна обмен"),25,6,new TextFormat(§_-22V§.§_-pJ§,16,16777215,true,null,null,null,null,"center")));
         var _loc1_:§_-hH§ = new §_-hH§(gls("Обменяться\nс друзьями"),0,14,null,1.5);
         _loc1_.x = 652;
         _loc1_.y = 6;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-o1B§);
         addChild(_loc1_);
         this.data = new §_-xc§();
         var _loc2_:int = 0;
         while(_loc2_ < §_-k2d§)
         {
            _loc4_ = new §_-U3§();
            _loc4_.addEventListener(MouseEvent.CLICK,this.§_-f29§);
            this.data.§_-yA§(_loc4_);
            _loc2_++;
         }
         var _loc3_:§_-22v§ = new §_-22v§(§_-k2d§,1,0,0,7,0,45,45);
         _loc3_.x = 160;
         _loc3_.y = 5;
         _loc3_.setData(this.data);
         addChild(_loc3_);
      }
      
      private function §_-o1B§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(!§_-9m§.§_-U1L§)
         {
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-81q§,0);
         }
         §_-9m§.§_-U1L§ = true;
         §_-EI§.load(function():void
         {
            §_-9m§.§_-031§(-1);
         });
      }
      
      private function §_-f29§(param1:MouseEvent) : void
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
            case §_-a9§.§_-JO§:
            case §_-a9§.§_-y1q§:
            case §_-a9§.§_-f15§:
            case §_-a9§.§_-C3f§:
               _loc2_ = true;
         }
         if(!_loc2_)
         {
            return;
         }
         if(this.§_-Vb§ == null)
         {
            this.§_-Vb§ = new §_-e2K§();
         }
         this.§_-Vb§.§_-ju§ = param1.currentTarget.elementId;
         this.§_-Vb§.show();
      }
   }
}

