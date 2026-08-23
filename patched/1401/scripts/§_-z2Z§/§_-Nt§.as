package §_-z2Z§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-T2y§.§_-ac§;
   import flash.text.TextFormat;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   
   public class §_-Nt§ extends §_-wP§
   {
      
      public var §_-C2w§:WardrobeOutfitSkinsPanel = null;
      
      public var character:int = 0;
      
      private var §_-VH§:§_-22V§ = null;
      
      public function §_-Nt§()
      {
         super(8,1,10,0,10,0,95,100);
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         var _loc2_:§_-A3s§ = null;
         super.setData(param1);
         this.§_-VH§.visible = param1.objects.length == 0;
         if(this.§_-Y1y§ != null)
         {
            for each(_loc2_ in param1.objects)
            {
               if(_loc2_.id == this.§_-Y1y§.id)
               {
                  select(_loc2_);
                  return;
               }
            }
         }
         select(param1.objects.length != 0 ? param1.objects[0] as §_-A3s§ : null);
      }
      
      public function §_-ja§() : void
      {
         if(this.data.objects.length != 0)
         {
            select(this.data.objects[0] as §_-A3s§);
         }
      }
      
      public function §_-r2M§() : void
      {
         var _loc1_:int = §_-h1f§.§_-Y2o§(this.character);
         if(_loc1_ == -1)
         {
            this.§_-ja§();
            return;
         }
         var _loc2_:int = §_-g2W§.§_-X2e§(_loc1_);
         var _loc3_:int = 0;
         while(_loc3_ < this.data.objects.length)
         {
            if((this.data.objects[_loc3_] as §_-619§).id == _loc2_)
            {
               select(this.data.objects[_loc3_] as §_-619§);
               this.offset = Math.max(0,Math.min(_loc3_,this.data.objects.length - this.§_-E2J§));
               break;
            }
            _loc3_++;
         }
      }
      
      override protected function init() : void
      {
         this.§_-VH§ = new §_-22V§(gls("У тебя ещё нет ни одного костюма"),0,50,new TextFormat(§_-22V§.§_-pJ§,16,16777215));
         this.§_-VH§.x = (§_-a9§.§_-9o§ - this.§_-VH§.textWidth) * 0.5;
         addChild(this.§_-VH§);
      }
      
      override protected function §_-bX§() : void
      {
         super.§_-bX§();
         this.§_-Z2B§.x = -this.§_-Z2B§.width - 1;
         this.§_-Z2B§.y = this.§_-xx§ + (this.§_-x16§ * (this.§_-c28§ + this.offsetY) - this.offsetY) * 0.5 - this.§_-Z2B§.height * 0.5;
         this.buttonNext.x = this.§_-32v§ * 2 + this.§_-E2J§ * (this.§_-i2s§ + this.offsetX) - this.offsetX + 1;
         this.buttonNext.y = this.§_-xx§ + (this.§_-x16§ * (this.§_-c28§ + this.offsetY) - this.offsetY) * 0.5 - this.buttonNext.height * 0.5;
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         if(this.§_-C2w§ == null)
         {
            return;
         }
         var _loc2_:§_-ac§ = §_-ac§.instance;
         if(_loc2_ != null && this.character != _loc2_.§_-nf§)
         {
            return;
         }
         this.§_-C2w§.§_-o1I§(param1);
      }
   }
}

