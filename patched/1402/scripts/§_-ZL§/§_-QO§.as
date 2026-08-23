package §_-ZL§
{
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-K1Y§;
   
   public class §_-QO§ extends Dialog
   {
      
      private static const §_-Q1g§:int = 200;
      
      private var §_-A3g§:Function;
      
      private var §_-b2v§:Function;
      
      private var content:§_-i5§ = null;
      
      private var §_-r1S§:Sprite = null;
      
      public function §_-QO§(param1:Function, param2:Function)
      {
         super(gls("Сохранение карты"),true,false);
         this.§_-A3g§ = param1;
         this.§_-b2v§ = param2;
         this.§_-r1S§ = new Sprite();
         addChild(this.§_-r1S§);
         this.content = new §_-i5§("",10,0,new TextFormat(null,14,2039583));
         this.§_-r1S§.addChild(this.content);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Отправить"));
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-03W§,false,0,true);
         var _loc4_:§_-K2G§ = new §_-K2G§(gls("Отмена"));
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-m5§,false,0,true);
         place(_loc3_,_loc4_);
         §_-K1Y§.§_-P2W§(this.content,"#Ac",ImageIconNut,0.6,0.6,-9,0,false);
      }
      
      override public function show() : void
      {
         this.content.text = gls("Отправление карты на модерацию стоит {0} #Ac.{1}",§_-Q1g§,§_-at§.§_-13l§(§_-lm§.location).award > 0 ? gls("\nВ случае её одобрения модератором,\nвы получите {0} #Ac.",§_-at§.§_-13l§(§_-lm§.location).award) : "");
         while(this.§_-r1S§.numChildren > 0)
         {
            this.§_-r1S§.removeChildAt(0);
         }
         this.§_-r1S§.addChild(this.content);
         §_-K1Y§.§_-P2W§(this.content,"#Ac",ImageIconNut,0.6,0.6,-10,0,false);
         this.width = this.content.width + 50;
         this.height = this.content.height + 80;
         super.show();
      }
      
      private function §_-m5§(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.§_-A3g§();
      }
      
      private function §_-03W§(param1:MouseEvent) : void
      {
         if(Game.self.nuts < §_-Q1g§)
         {
            return;
         }
         this.§_-b2v§();
         hide();
      }
   }
}

