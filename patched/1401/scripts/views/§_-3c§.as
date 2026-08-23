package views
{
   import §_-I10§.§_-l1f§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-3c§ extends Sprite
   {
      
      protected var view:Sprite = null;
      
      protected var §_-V1f§:§_-22V§ = null;
      
      protected var §_-x2y§:§_-22V§ = null;
      
      protected var §_-S5§:§_-22V§ = null;
      
      protected var §_-q2M§:§_-22V§ = null;
      
      public function §_-3c§()
      {
         super();
         this.view = new ImageBundleGoldCup();
         this.§_-V1f§ = new §_-22V§(§_-l1f§.§_-c2b§.toString(),0,0,new TextFormat(§_-22V§.§_-pJ§,27,16777215,true));
         this.§_-x2y§ = new §_-22V§(gls("за {0} дней",§_-l1f§.§_-F24§),0,0,new TextFormat(§_-22V§.§_-pJ§,12,16777215,true));
         this.§_-S5§ = new §_-22V§("+" + §_-l1f§.§_-w2a§,0,0,new TextFormat(§_-22V§.§_-pJ§,16,16777215,true));
         this.§_-q2M§ = new §_-22V§(gls("В день"),0,0,new TextFormat(§_-22V§.§_-pJ§,15,16777215,true));
         addChild(this.view);
         addChild(this.§_-V1f§);
         addChild(this.§_-x2y§);
         addChild(this.§_-S5§);
         addChild(this.§_-q2M§);
         this.§_-V1f§.x = 77;
         this.§_-V1f§.y = 62;
         this.§_-x2y§.x = 75;
         this.§_-x2y§.y = 95;
         this.§_-S5§.rotation = 15;
         this.§_-S5§.x = 63;
         this.§_-S5§.y = 120;
         this.§_-q2M§.rotation = -10;
         this.§_-q2M§.x = 107;
         this.§_-q2M§.y = 130;
      }
      
      public function §_-l1c§() : void
      {
         this.removeChild(this.§_-q2M§);
         this.removeChild(this.§_-S5§);
         this.view.removeChild((this.view as ImageBundleGoldCup).flag);
      }
   }
}

