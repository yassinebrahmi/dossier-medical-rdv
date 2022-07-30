<?php

if (isset($_GET['fiche_id']) && isset($_GET['patient_id'])){
    include  '..\Models\Medecin.php';
    $f = new \Medical\Medecin();
    $fiche = $f->find_fiche($_GET['fiche_id']);
    $patient = $f->find_patient($_GET['patient_id']);
}
else{
    $fiche = null;
    $patient = null;
}


?>
<div class="row">
    <div class="col-lg-6 mt-2">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Information Patient</h4>
            </div><!--end card-header-->
            <div class="card-body">
                <div class="general-label">

                        <div class="form-group row">
                            <label for="nomprenom" class="col-sm-4 col-form-label font-weight-bold">Nom & Prénom</label>
                            <div class="col-sm-8">
                                <input type="text" name="nom_prenom" class="form-control" id="nomprenom"
                                       value="<?= $patient['nom_prenom'] ?>" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="sexe" class="col-sm-4 col-form-label font-weight-bold">Sexe</label>
                            <div class="col-sm-8">
                                <select id="sexe" class="form-control" name="sexe" readonly="">
                                    <option value="Homme" <?php if ($patient['sexe'] == "Homme") echo "selected"; else echo ''; ?> >
                                        Homme
                                    </option>
                                    <option value="Femme" <?php if ($patient['sexe'] == "Femme") echo "selected"; else echo ''; ?> >
                                        Femme
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="date_naissance" class="col-sm-4 col-form-label font-weight-bold">Date de
                                naissance</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="date_naissance"
                                       value="<?= $patient['date_naissance'] ?>" name="date_naissance" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-4 col-form-label font-weight-bold">Adresee mail</label>
                            <div class="col-sm-8">
                                <input type="email" name="email" class="form-control" value="<?= $patient['email'] ?>"
                                       readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="tel" class="col-sm-4 col-form-label font-weight-bold">Tél</label>
                            <div class="col-sm-8">
                                <input type="tel" name="tel" class="form-control" value="<?= $patient['tel'] ?>"
                                       readonly>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 mt-2 text-left">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Consultation Médecin</h4>
            </div><!--end card-header-->
            <div class="card-body">
                <div class="general-label">
                    <form method="post" action="../controller/action.php?query=note_fiche">
                        <input name="fiche_id" type="hidden" value="<?=$_GET['fiche_id']?>">
                        <div class="form-group row">
                            <label for="sexe" class="col-sm-4 col-form-label font-weight-bold">Date arrivé patient</label>
                            <div class="col-sm-8">
                                <input type="text" name="created_at" class="form-control" value="<?= $fiche['created_at'] ?>"
                                       readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="sexe" class="col-sm-4 col-form-label font-weight-bold">Note médecin</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="note_medecin" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="row text-right">
                            <div class="col-sm-10 ml-auto">
                                <button type="submit" class="btn btn-primary">Valider</button>

                            </div>
                        </div>
                        <div class="form-group row">

                        </div>
                </div>

                </form>
            </div>
        </div><!--end card-body--></div>
</div>
</div>
