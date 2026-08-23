package views
{
   import §_-X1k§.§_-T2A§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-i2V§ extends Sprite
   {
      
      protected var view:Sprite = null;
      
      protected var §_-A2B§:§_-i5§ = null;
      
      protected var §_-c1C§:§_-i5§ = null;
      
      protected var §_-y2j§:§_-i5§ = null;
      
      protected var §_-53D§:§_-i5§ = null;
      
      public function §_-i2V§()
      {
         super();
         this.view = new ImageBundleGoldCup();
         this.§_-A2B§ = new §_-i5§(§_-T2A§.§_-P2D§.toString(),0,0,new TextFormat(§_-i5§.§_-p1s§,27,16777215,true));
         this.§_-c1C§ = new §_-i5§(gls("за {0} дней",§_-T2A§.§_-G24§),0,0,new TextFormat(§_-i5§.§_-p1s§,12,16777215,true));
         this.§_-y2j§ = new §_-i5§("+" + §_-T2A§.§_-R1§,0,0,new TextFormat(§_-i5§.§_-p1s§,16,16777215,true));
         this.§_-53D§ = new §_-i5§(gls("В день"),0,0,new TextFormat(§_-i5§.§_-p1s§,15,16777215,true));
         addChild(this.view);
         addChild(this.§_-A2B§);
         addChild(this.§_-c1C§);
         addChild(this.§_-y2j§);
         addChild(this.§_-53D§);
         this.§_-A2B§.x = 77;
         this.§_-A2B§.y = 62;
         this.§_-c1C§.x = 75;
         this.§_-c1C§.y = 95;
         this.§_-y2j§.rotation = 15;
         this.§_-y2j§.x = 63;
         this.§_-y2j§.y = 120;
         this.§_-53D§.rotation = -10;
         this.§_-53D§.x = 107;
         this.§_-53D§.y = 130;
      }
      
      public function §_-M1s§() : void
      {
         this.removeChild(this.§_-53D§);
         this.removeChild(this.§_-y2j§);
         this.view.removeChild((this.view as ImageBundleGoldCup).flag);
      }
   }
}

