package §_-Q1P§
{
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-jB§;
   
   public class §_-Mh§ extends Dialog
   {
      
      private static const §_-F16§:int = 200;
      
      private var §_-T2I§:Function;
      
      private var §_-91R§:Function;
      
      private var content:§_-22V§ = null;
      
      private var §_-J2v§:Sprite = null;
      
      public function §_-Mh§(param1:Function, param2:Function)
      {
         super(gls("Сохранение карты"),true,false);
         this.§_-T2I§ = param1;
         this.§_-91R§ = param2;
         this.§_-J2v§ = new Sprite();
         addChild(this.§_-J2v§);
         this.content = new §_-22V§("",10,0,new TextFormat(null,14,2039583));
         this.§_-J2v§.addChild(this.content);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Отправить"));
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-p2u§,false,0,true);
         var _loc4_:§_-j18§ = new §_-j18§(gls("Отмена"));
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-K1H§,false,0,true);
         place(_loc3_,_loc4_);
         §_-jB§.§_-fG§(this.content,"#Ac",ImageIconNut,0.6,0.6,-9,0,false);
      }
      
      override public function show() : void
      {
         this.content.text = gls("Отправление карты на модерацию стоит {0} #Ac.{1}",§_-F16§,§_-q1p§.§_-l29§(§_-y2d§.location).award > 0 ? gls("\nВ случае её одобрения модератором,\nвы получите {0} #Ac.",§_-q1p§.§_-l29§(§_-y2d§.location).award) : "");
         while(this.§_-J2v§.numChildren > 0)
         {
            this.§_-J2v§.removeChildAt(0);
         }
         this.§_-J2v§.addChild(this.content);
         §_-jB§.§_-fG§(this.content,"#Ac",ImageIconNut,0.6,0.6,-10,0,false);
         this.width = this.content.width + 50;
         this.height = this.content.height + 80;
         super.show();
      }
      
      private function §_-K1H§(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         this.§_-T2I§();
      }
      
      private function §_-p2u§(param1:MouseEvent) : void
      {
         if(Game.self.nuts < §_-F16§)
         {
            return;
         }
         this.§_-91R§();
         hide();
      }
   }
}

